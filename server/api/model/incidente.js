
"use strict";
var moment = require('moment');

module.exports = function(sequelize, DataTypes) {
  var incidente = sequelize.define("incidente", {
    idIncidente: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  nombre: DataTypes.STRING,
  descripcion: DataTypes.STRING,
  idUsuarioKU:DataTypes.INTEGER,
  idUsuarioConsultor:DataTypes.INTEGER,
  fechaCreacion:DataTypes.DATE,
  idSubTipoIncidente:DataTypes.INTEGER,
  idTipoIncidente:DataTypes.INTEGER,
  idEstado:DataTypes.INTEGER,
  idOrigenProblema:DataTypes.INTEGER,
  idCodigoTermino:DataTypes.INTEGER,
  fechaCierre:DataTypes.DATE,
  fechaActualizacion:DataTypes.DATE,
  comentarioConsultor: DataTypes.STRING,
  sla:DataTypes.INTEGER,
   tiempoTranscurrido: {
    type     : DataTypes.VIRTUAL,
    
      get: function () {
        //falta implementar diferencias para el calculo del SLA  
        
var now         

if (this.fechaCierre==null)
now = moment(Date.now());
else
 now = moment(this.fechaCierre);
 


 return Math.round(now.diff(this.fechaCreacion, 'hours', true));
      
     },
    
  }
  }, 
   {
    classMethods: {
      associate: function(models) {

        incidente.belongsTo(models.usuario,{foreignKey:'idUsuarioKU', as:'ku'})
        incidente.belongsTo(models.usuario,{foreignKey:'idUsuarioConsultor', as:'consultor'})
        incidente.belongsTo(models.tipoincidente,{foreignKey:'idTipoIncidente', as:'tipoIncidente'})
        incidente.belongsTo(models.subtipoincidente,{foreignKey:'idSubTipoIncidente', as:'subtipoincidente'})
        incidente.belongsTo(models.origenproblema,{foreignKey:'idOrigenProblema', as:'origenproblema'})
        incidente.belongsTo(models.codigotermino,{foreignKey:'idCodigoTermino', as:'codigotermino'})
        incidente.belongsTo(models.estado,{foreignKey:'idEstado', as:'estado'})
        incidente.hasMany(models.incidenteHistorial,{foreignKey:'idIncidente', as:'historial'})
        incidente.hasMany(models.adjunto,{foreignKey:'IncidenteId', as:'adjuntos'})
            }
                 }
     
   },
  
  {
   createdAt: false,
 
  // I want updatedAt to actually be called updateTimestamp
  updatedAt: false,
  tableName: 'incidente', // this will define the table's name
  timestamps: false           // this will deactivate the timestamp columns
}
  );

  return incidente;
};


