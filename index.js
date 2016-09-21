'use strict'
var SequelizeAuto = require('sequelize-auto')
var transform = require('./generic_transform')
var Sequelize = require('sequelize');
var fs = require('fs');
var path = require("path");
var parse = require('csv-parse');
var async = require('async');
var files = './files/';
var dotenv = require('dotenv');
dotenv.load();

var sequelize = new Sequelize(
  process.env.DB_NAME, process.env.DB_USER, process.env.DB_PASSWORD, {
    dialect: process.env.DB_DIALECT,
    port: process.env.PORT,
    host: process.env.DB_HOST,
    define: {
      timestamps: false
    }
  });

// 1 & 2
var auto = new SequelizeAuto(
  process.env.DB_NAME, process.env.DB_USER, process.env.DB_PASSWORD, {
    dialect: process.env.DB_DIALECT,
    port: process.env.PORT,
    host: process.env.DB_HOST,
    define: {
      timestamps: false
    }
  });

auto.run(function(err) {
  if (err) throw err;

  var file = String("users.csv");
  var model = file.split('.')[0];
  var keyModel = auto.foreignKeys[model];
  async.waterfall([
    async.apply(fs.readFile, path.join(__dirname, files, file)),
    parse,
    transform.readRecords,
  ], (results, err) => {
    for (var i = 0; i < results.length; i++) {
      var record = results[i];
      belongsToCheck(keyModel, 'name', record, (modelWithForeignKey) => {

        var Model = sequelize.import(__dirname + "/models/" + model);
        validationType(model, modelWithForeignKey, (validModel) => {

          Model.create(validModel)
            .then((savedModel) => {
              console.log(savedModel)
            })
            .catch((err) => {
               console.log(err)
             });

        })
      });
    }
  });
});

function validationType(model, recordModel, cb) {
  for (var key in recordModel) {

    var Model = sequelize.import(__dirname + "/models/" + model);

    var type = Model.tableAttributes[key].type.constructor.key;

    if (['INTEGER', 'BIGINT'].indexOf(type) !== -1) {
      recordModel[key] = Number(recordModel[key]);
    }
  }
  cb(recordModel);
}

function belongsToCheck(keyModel, searchKey, recordModel, cb) {
  var i = 0;
  for (var key in keyModel) {
    i++;
    if (keyModel[key].target_table != null) {
      var foreignKeyModel = sequelize.import(__dirname + "/models/" +
        keyModel[key].target_table);

      var searchCriteria = {};
      searchCriteria[searchKey] = recordModel[keyModel[key].source_column];

      if (recordModel[keyModel[key].source_column] && searchCriteria[searchKey]) {

        let columnFk = keyModel[key].source_column

        foreignKeyModel.findOrCreate({
          where: searchCriteria,
          defaults: {}
        }).spread(function(object, created) {

          recordModel[columnFk] = Number(object.id);

          if (Object.keys(keyModel).length === i) {
            cb(recordModel);
          }

        }).error((err) => {
          cb(recordModel)
        })
      }

    } else {
      if (Object.keys(keyModel).length === i) {
        cb(recordModel);
      }
    }
  }
}
