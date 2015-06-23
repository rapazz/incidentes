var models  = require('../model');
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

                    return notificar;

                });
            else
                notificacion.updateAttributes({
                    cantidad: notificacion.cantidad +1

                }).success(function(x){
                    return x;
                })

        })



}

exports.cargarNotificaciones = function(req,res){

    models.notificaciones.findAll({where:{usuarioId:req.params.id}

    }).then(function(n) {
        return res.json(200, n);

    });

}

exports.marcarLeida=function (req,res){

    console.log(usuarioId);
    models.notificaciones.destroy({where:{usuarioId:req.body.usuarioId} }).success(function(t) {

       return  res.json(200, t);
    })



    }