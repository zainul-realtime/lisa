class Transformer {
  prop = [];

  get toModel(options, callback) {
    let record = {};
    let attribute;
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

  get readRecords(records, callback) => {
    let z = 0;
    let models = [];
    records.forEach((output, i, array) => {
      this.toModel({
        output,
        i
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
}

export default Transformer;
