"use strict";

module.exports = function(sequelize, DataTypes) {
  var indicadoresIncidentes = sequelize.define("indicadoresIncidentes", {
    id: {type: DataTypes.INTEGER, primaryKey: true },
    idIncidente: DataTypes.INTEGER,
    idUsuarioKU:DataTypes.STRING,
    idUsuarioConsultor:DataTypes.INTEGER,
    SLA:DataTypes.INTEGER,
    idEstado: DataTypes.INTEGER,
    mes:DataTypes.INTEGER,
    anno:DataTypes.INTEGER,
    tiempo:DataTypes.INTEGER,
    cumpleSLA:DataTypes.INTEGER,
    idOrigenProblema: DataTypes.INTEGER,
    idTipoIncidente:DataTypes.INTEGER
    
  }, 
   {
    classMethods: {
      associate: function(models) {

        indicadoresIncidentes.belongsTo(models.usuario,{foreignKey:'idUsuarioKU', as:'ku'})
        indicadoresIncidentes.belongsTo(models.usuario,{foreignKey:'idUsuarioConsultor', as:'consultor'})
        indicadoresIncidentes.belongsTo(models.origenproblema,{foreignKey:'idOrigenProblema', as:'origenproblema'})
        indicadoresIncidentes.belongsTo(models.tipoincidente,{foreignKey:'idTipoIncidente', as:'tipoincidente'})
      }
                 }
     
   },
  {
  tableName: 'empresa', // this will define the table's name
  timestamps: false           // this will deactivate the timestamp columns
}
  );

  return indicadoresIncidentes;
};