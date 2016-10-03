'use strict';

class Validator {

  constructor(options) {
    this.sequelize = options.sequelize;
    this.newRecordModel = {};
  }

  validationType(model, recordModel) {

    for (let key in recordModel) {
      let Model = this.sequelize.import(__dirname + "/models/" + process.env.NODE_ENV +
        "/" + model);

      let type = Model.tableAttributes[key].type.constructor.key;
      if (['INTEGER', 'BIGINT'].indexOf(type) !== -1) {
        if (recordModel[key] == '') {
          recordModel[key] = null
        } else {
          recordModel[key] = Number(recordModel[key]);
        }
      }
    }

    return recordModel;
  }

  belongsToCheck(keyModel, mappers, modelName, recordModel, cb) {
    // record model always get new
    var i =0;

    this.newRecordModel = recordModel;

    for (var key in keyModel) {

      if (keyModel[key].target_table != null) {

        var searchKey = this.builderSearchKey(keyModel, mappers, modelName, key);

        var foreignKeyModel = this.hasRootSearch(searchKey, this.sequelize, keyModel, key);

        var searchCriteria = {};

        searchCriteria[searchKey] = recordModel[keyModel[key].source_column];

        if (recordModel[keyModel[key].source_column] && searchCriteria[searchKey]) {

          var columnFk = keyModel[key].source_column;

          let createdModel = this.foreignKeySearch(foreignKeyModel, searchCriteria);

          createdModel.then((res)=> {

            let object = res.object.toJSON();

            if (isNaN(Number(object.id))) {
              this.newRecordModel[columnFk] = null;
            } else {
              this.newRecordModel[columnFk] = Number(object.id);
            }

            i++;
            this.finishCallback(i, keyModel) && this.buildRecord(cb);
          }).catch((err) => {

            i++;
            this.finishCallback(i, keyModel) && this.buildRecord(cb);
          })
        }else {

          i++;
          this.finishCallback(i, keyModel) && this.buildRecord(cb);
        }
      } else {

        i++;
        this.finishCallback(i, keyModel) && this.buildRecord(cb);
      }
    }
  }

  buildRecord(cb) {
    var data = this.newRecordModel;
    cb(data);
  }

  finishCallback(i, keyModel) {
    return Object.keys(keyModel).length === i;
  }

  async foreignKeySearch(foreignKeyModel, searchCriteria) {
    return await foreignKeyModel.findOrCreate({
        where: searchCriteria,
        defaults: {}
      }).spread((object, created) => {;
        return {object, created};
      })
  }

  builderSearchKey(keyModel, mappers, modelName, key) {
    let searchKey;
    for (let keyMapper in mappers) {

      if (keyMapper === modelName) {

        let mapperModel = mappers[keyMapper];
        for (var keyColumn in mapperModel) {

          if (keyColumn === keyModel[key].source_column) {
            searchKey = mapperModel[keyColumn];
          }
        }
      }
    }
    return searchKey;
  }

  hasRootSearch(searchKey, sequelize, keyModel, key) {
    if (searchKey && searchKey.hasOwnProperty("rootSearch")) {

      var foreignKeyModel = sequelize.import(__dirname + "/models/" +
        process.env.NODE_ENV + "/" +
        searchKey['rootSearch']);
      searchKey = searchKey['column'];

    } else {

      var foreignKeyModel = sequelize.import(__dirname + "/models/" +
        process.env.NODE_ENV + "/" +
        keyModel[key].target_table);

    }

    return foreignKeyModel;
  }
}

export default Validator;
