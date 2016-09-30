'use strict'
import Transformer from './transformer';
import Validator from './Validator';
import Install from './install';
import DB from './db';

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
var chalk = require('chalk');

let db = new DB();
let install = new Install({
  hasInstalledDep,
  installedDep,
  yaml,
  exec,
  fs
})

let sequelize = db.setORM(Sequelize);
let auto = db.setORM(SequelizeAuto);
var transformer = new Transformer();

install.setupDependecies();

sequelize
  .authenticate()
  .then(function(err) {
    console.log('Connection has been established successfully.');
  })
  .catch(function(err) {
    console.log('Unable to connect to the database:', err);
  });

let validation = new Validator({
  sequelize
})

var mappers = yaml.load(__dirname + '/mapper.yml');

if (install.hasInstalledDep) {
  auto.run(function(err) {
    if (err) throw err;

    var file = String("employees.csv");
    var model = file.split('.')[0];
    var keyModel = auto.foreignKeys[model];

    async.waterfall([
      async.apply(fs.readFile, path.join(__dirname, files, file)),
      parse,
    ], (err, parsed) => {
      transformer.readRecords(parsed, (results) => {

        for (var i = 0; i < results.length; i++) {

          var record = results[i];

          validation.belongsToCheck(keyModel, mappers, model, record, (modelWithForeignKey) => {

            var Model = sequelize.import(__dirname + "/models/" + process.env.NODE_ENV + "/" + model);

            let validModel = validation.validationType(model, modelWithForeignKey);

            Model.create(validModel)
              .then((savedModel) => {
                console.log(chalk.green(savedModel.toJSON()))
              })
              .catch((err) => {
                console.log(chalk.red.bgYellow(err.original.detail))
                console.log(chalk.red(err.sql))
              });

          });
        }

      })

    });

  });
}
