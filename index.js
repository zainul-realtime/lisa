var SequelizeAuto = require('sequelize-auto')
var transform = require('./generic_transform')
var fs = require('fs');
var path = require("path");
var parse = require('csv-parse');
var async = require('async');
var files = './files/';

// var auto = new SequelizeAuto('healthcare', 'zainul', 'Realtime1!', {
//     dialect: 'postgres',
//     port: 5432,
//     host: 'localhost'
// });

var file = 'contacts.csv';

async.waterfall([
    async.apply(fs.readFile, path.join(__dirname, files, file)),
    parse,
    transform.readRecords,
], (results, err) => {
  console.log(results)
});

// auto.run(function(err) {
//     if (err) throw err;
//
//     // console.log(auto.tables); // table list
//     // console.log(auto.foreignKeys); // foreign key list
// });
