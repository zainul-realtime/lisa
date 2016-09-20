var SequelizeAuto = require('sequelize-auto')
var auto = new SequelizeAuto('healthcare', 'zainul', 'Realtime1!', {
  dialect: 'postgres',
  port: 5432,
  host: 'localhost'
});

auto.run(function (err) {
  if (err) throw err;

  // console.log(auto.tables); // table list
  // console.log(auto.foreignKeys); // foreign key list
});
