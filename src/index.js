'use strict'
import transform from './transformer';

var SequelizeAuto = require('sequelize-auto')
var Sequelize = require('sequelize');
var fs = require('fs');
var path = require("path");
var parse = require('csv-parse');
var async = require('async');
var files = './files/';
var yaml = require('yamljs');
var sequelizeLogger = require('sequelize-log-syntax-colors');
var exec = require('child_process').exec;
var dotenv = require('dotenv');
dotenv.load();
var installedDep = __dirname + '/install.yml';
var hasInstalledDep;

try {
  hasInstalledDep = yaml.load(installedDep);
} catch (e) {}

if (!hasInstalledDep) {
  exec('npm install -g sequelize-auto').stdout.pipe(process.stdout);
  exec('npm install -g pg pg-hstore').stdout.pipe(process.stdout);
  exec('sequelize-auto -o "./models/' + process.env.NODE_ENV
                            + '" -d ' + process.env.DB_NAME
                            + ' -h ' + process.env.DB_HOST
                            + ' -u ' + process.env.DB_USER
                            + ' -p ' + process.env.DB_PORT
                            + ' -x ' + process.env.DB_PASSWORD
                            + ' -e ' + process.env.DB_DIALECT, function (error, stdout, stderr) {
                              console.log(error, stdout, stderr)
    })
  try {
    fs.writeFileSync(installedDep, "install: true", 'utf8');
  } catch (e) {
    console.log(e)
  }
}
//
var sequelize = new Sequelize(
  process.env.DB_NAME, process.env.DB_USER, process.env.DB_PASSWORD, {
    dialect: process.env.DB_DIALECT,
    port: process.env.DB_PORT,
    host: process.env.DB_HOST,
    logging: false,
    define: {
      timestamps: false
    }
  });

sequelize
  .authenticate()
  .then(function(err) {
    console.log('Connection has been established successfully.');
  })
  .catch(function (err) {
    console.log('Unable to connect to the database:', err);
  });

// 1 & 2
var auto = new SequelizeAuto(
  process.env.DB_NAME, process.env.DB_USER, process.env.DB_PASSWORD, {
    dialect: process.env.DB_DIALECT,
    port: process.env.DB_PORT,
    host: process.env.DB_HOST,
    logging: false,
    define: {
      timestamps: sequelizeLogger
    }
  });

var mappers = yaml.load(__dirname + '/mapper.yml');

if (hasInstalledDep) {
  auto.run(function(err) {
    if (err) throw err;

    var file = String("positions.csv");
    var model = file.split('.')[0];
    var keyModel = auto.foreignKeys[model];

    async.waterfall([
      async.apply(fs.readFile, path.join(__dirname, files, file)),
      parse,
      transform.readRecords,
    ], (results, err) => {
      for (var i = 0; i < results.length; i++) {
        var record = results[i];
        belongsToCheck(keyModel, mappers, model, record, (modelWithForeignKey) => {

          var Model = sequelize.import(__dirname + "/models/" + process.env.NODE_ENV + "/" + model);
          validationType(model, modelWithForeignKey, (validModel) => {
            // console.log(validModel)
            Model.create(validModel)
            .then((savedModel) => {
              console.log("savedModel")
            })
            .catch((err) => {
              console.log(err.original.detail)
              console.log(err.sql)
            });
          })
        });
      }
    });
  });
}

function validationType(model, recordModel, cb) {
  for (var key in recordModel) {

    var Model = sequelize.import(__dirname + "/models/" + process.env.NODE_ENV + "/" + model);

    var type = Model.tableAttributes[key].type.constructor.key;

    if (['INTEGER', 'BIGINT'].indexOf(type) !== -1) {
      // console.log(recordModel[key])
      if (recordModel[key] == '') {
        recordModel[key] = null
      }else {
        recordModel[key] = Number(recordModel[key]);
      }
    }
  }
  cb(recordModel);
}

function belongsToCheck(keyModel, mappers, modelName, recordModel, cb) {
  var i = 0;
  for (var key in keyModel) {

    if (keyModel[key].target_table != null) {

      var searchKey;

      for (var keyMapper in mappers) {

        if (keyMapper === modelName) {

          var mapperModel = mappers[keyMapper];
          for (var keyColumn in mapperModel) {

            if (keyColumn === keyModel[key].source_column) {
              searchKey = mapperModel[keyColumn];
            }
          }
        }
      }

      if (searchKey.hasOwnProperty("rootSearch")) {
        var foreignKeyModel = sequelize.import(__dirname + "/models/" + process.env.NODE_ENV + "/" +
          searchKey['rootSearch']);
        searchKey = searchKey['column'];
      } else {
        var foreignKeyModel = sequelize.import(__dirname + "/models/" + process.env.NODE_ENV + "/" +
          keyModel[key].target_table);
      }

      var searchCriteria = {};
      searchCriteria[searchKey] = recordModel[keyModel[key].source_column];

      if (recordModel[keyModel[key].source_column] && searchCriteria[searchKey]) {

        let columnFk = keyModel[key].source_column

        foreignKeyModel.findOrCreate({
          where: searchCriteria,
          defaults: {}
        }).spread(function(object, created) {
          if (isNaN(Number(object.id))) {
            recordModel[columnFk] = null;
          } else {
            recordModel[columnFk] = Number(object.id) || null;
          }

          i++;
          if (Object.keys(keyModel).length === i) {
            cb(recordModel);
          }

        }).catch((err) => {
          i++;
          if (Object.keys(keyModel).length === i) {
            cb(recordModel);
          }
        });

      }else {
        i++;
      }

    } else {
      i++;
      if (Object.keys(keyModel).length === i) {
        cb(recordModel);
      }
    }
  }
}
