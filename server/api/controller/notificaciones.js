var models  = require('../model');
var clients = require('../sockets/variables.js');
exports.crearNotificacion=function(email,tipo){
    //buscar  si  existe sumar si no Agregar el registro.

    models.notificaciones.find({where:{usuarioId:email,tipoNotificacion:tipo}})
        .success(function(notificacion){

            if (notificacion == null)
                models.notificaciones.create({
                    usuarioId:email,
                    tipoNotificacion:tipo,
                    cantidad: 1


                }).success(function(notificar) {
                    enviarNotificacion(email)
                    return notificar;

                });
            else
                notificacion.updateAttributes({
                    cantidad: notificacion.cantidad +1

                }).success(function(x){
                    enviarNotificacion(email)
                    return x;
                })


        })



}

exports.cargarNotificaciones = function(req,res){

    models.notificaciones.findAll({where:{usuarioId:req.params.id}, include :[{model:models.parametros, as :'tipo'}]

    }).then(function(n) {
        return res.json(200, n);

    });

}


function enviarNotificacion(usuario){


        models.notificaciones.findAll({where:{usuarioId:usuario}, include :[{model:models.parametros, as :'tipo'}]

        }).then(function(n) {

            clients[usuario].emit("notificar", JSON.stringify(n))

        });



}


exports.marcarLeida=function (req,res){


    models.notificaciones.destroy({where:{usuarioId:req.body.notificacion.usuarioId,tipoNotificacion:req.body.notificacion.tipoNotificacion} }).success(function(t) {

        enviarNotificacion(req.body.notificacion.usuarioId)
       return  res.json(200, t);
    })



    }