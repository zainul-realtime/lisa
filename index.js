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
    host: process.env.DB_HOST
});

var file = String("contacts.csv");
var model = file.split('.')[0];

// 3
// async.waterfall([
//     async.apply(fs.readFile, path.join(__dirname, files, file)),
//     parse,
//     transform.readRecords,
// ], (results, err) => {
//   console.log(results)
// });

// 4
// console.log(model)
// var Model = sequelize.import(__dirname + "/models/" + model);
// Model.findOne({ where: 1 }).then((sqlResponse)=> {
//   console.log(sqlResponse.toJSON());
// })
// .catch(function (error) {
//   // console.log({ error })
// });

// 2
auto.run(function(err) {
    if (err) throw err;

    // console.log(auto.tables); // table list
    console.log(auto.foreignKeys[model]); // foreign key list
});
