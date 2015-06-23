

"use strict";

module.exports = function(sequelize, DataTypes) {
  var usuario = sequelize.define("usuario", {
    usuarioId : {type: DataTypes.INTEGER, primaryKey: true },
  nombre: DataTypes.STRING,
  email: DataTypes.STRING,
  fechaCreacion: DataTypes.DATE,
  fechaActualizacion: DataTypes.DATE,
  fechaUltimoLogin: DataTypes.DATE,
      rolesMenu: DataTypes.STRING,
  estado: DataTypes.INTEGER,
  idEmpresa:DataTypes.INTEGER,
  foto:DataTypes.STRING,
  dashboard:DataTypes.STRING

  },
   {
    classMethods: {
      associate: function(models) {

        usuario.belongsTo(models.empresa,{foreignKey:'idEmpresa', as:'empresa'})
        
            }
                 }
     
   },
  {
  tableName: 'usuario', // this will define the table's name
  timestamps: false           // this will deactivate the timestamp columns
}
  );

  return usuario;
};
