
"use strict";

module.exports = function(sequelize, DataTypes) {
    var notificaciones = sequelize.define("notificaciones", {
            id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
            usuarioId: DataTypes.INTEGER,
            tipoNotificacion:DataTypes.INTEGER,
            cantidad:DataTypes.INTEGER


        },
        {
            classMethods: {
                associate: function(models) {

                    notificaciones.belongsTo(models.parametros,{foreignKey:'tipoNotificacion', as:'tipo'})




                }
            }

        },
        {
            createdAt: false,

            // I want updatedAt to actually be called updateTimestamp
            updatedAt: false,
            tableName: 'notificaciones', // this will define the table's name
            timestamps: false           // this will deactivate the timestamp columns
        }
    );

    return notificaciones;
};


