"use strict";

module.exports = function(sequelize, DataTypes) {
  var empresa = sequelize.define("empresa", {
    idEmpresa: {type: DataTypes.INTEGER, primaryKey: true },
   rut: DataTypes.STRING,   
  nombre: DataTypes.STRING
  }, 
  {
  tableName: 'empresa', // this will define the table's name
  timestamps: false           // this will deactivate the timestamp columns
}
  );

  return empresa;
};