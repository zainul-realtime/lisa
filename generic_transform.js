var prop = [];
var self = this;
exports.toModel = (options, callback) => {
    var record = {};
    var attribute;
    if (options.i === 0) {
        prop = [];
        options.output.map((value) => {
            prop.push(value);
        })
    } else {
        options.output.map((value, i) => {
            record[prop[i]] = value;
        })
    }
    return callback(record)
}

exports.readRecords = (records, callback) => {
  var z=0;
  var models = [];
  records.forEach((output, i, array) => {
    self.toModel({
      output,i
    }, (model) => {
      if (model && Object.getOwnPropertyNames(model).length > 0)
        models.push(model)

      z++;
      if (z === array.length) {
        callback(models);
      }
    })
  })
}
