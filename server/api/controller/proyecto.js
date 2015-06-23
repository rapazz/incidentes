var models  = require('../model');
var express = require('express');
var historialProyecto = require('./proyecto.historial');
var mailer= require('./mailer');
var versionProyecto = require('./proyecto.version');
var uid = require("node-uuid");
var config = require('../../config/environment');
var notificacion = require('./notificaciones');


//Permite crear una iniciativa
exports.crearIniciativa = function(req, res) {

    models.bpEmpresa.find({where:{idEmpresa:req.body.proyecto.idEmpresa,idDepartamento:req.body.proyecto.idDepartamento,} }).success(function(bp) {
        models.proyecto.create({
            nombre:req.body.proyecto.titulo,
            idSolicitante:req.body.proyecto.usuario.usuarioId,
            idEmpresa:req.body.proyecto.idEmpresa,
            idDepartamento:req.body.proyecto.idDepartamento,
            resumenEjecutivo :req.body.proyecto.resumenEjecutivo,
            idEtapaProyecto:1,
            idEstadoProyecto:1,
            idBp:bp.usuarioId,
            fechaCreacion: new Date()

        }).success(function(proyecto) {

            var historial ={}
            historial.idProyecto = proyecto.idProyecto;
            historial.idEmpresa = proyecto.idEmpresa;
            historial.idDepartamento= proyecto.idDepartamento;
            historial.usuarioId=req.body.proyecto.usuario.usuarioId;
            historial.idEstadoProyecto= 1;
            historial.idEtapaProyecto = 1;
            historial.descripcion  =''
            historialProyecto.insertarHistorial(historial)
notificacion.crearNotificacion(proyecto.idBp,1)
            //Enviar Email
/*
            models.proyecto.find({where:{idProyecto:proyecto.idProyecto},
                include :[{model:models.empresa, as :'empresa'},
                    {model:models.usuario,as:'usuario'},
                    {model:models.usuario, as:'usuarioBp' },{model:models.etapaProyecto, as:'etapa' },
                    {model:models.estadoProyecto, as:'estadoProyecto' }
                ]

            }).success(function(p) {
                mailer.EnvioEmailIniciativa(2,p)


            });

*/





            return res.status(200).json(proyecto);

        });

    });

}

//Lista las iniciativas para que sean aprobadas
exports.iniciativasPendientes = function(req, res) {

    models.proyecto.findAll({where:{
        idBp:req.params.id,
        idEtapaProyecto:1,
        idEstadoProyecto:1
    },

        include :[{model:models.empresa, as :'empresa'},{model:models.departamento,as:'departamento'},
            {model:models.usuario,as:'usuario'},
            {model:models.estadoProyecto, as:'estadoProyecto' }]

    }).success(function(proyecto) {

        return res.status(200).json(proyecto);

    });
}


exports.porJefeProyecto = function(req, res) {

    models.proyecto.findAll({where:{
        idJefeProyecto:req.params.id

    },

        include :[{model:models.empresa, as :'empresa'},{model:models.departamento,as:'departamento'},
            {model:models.usuario,as:'usuario'},{model:models.usuario,as:'jefeProyecto'},
            {model:models.usuario, as:'usuarioBp' },{model:models.etapaProyecto, as:'etapa' },
            {model:models.estadoProyecto, as:'estadoProyecto' }]

    }).success(function(proyecto) {

        return res.json(200, proyecto);

    });
}


exports.porBp = function(req, res) {

    models.proyecto.findAll({where:{
        idBp:req.params.id

    },

        include :[{model:models.empresa, as :'empresa'},{model:models.departamento,as:'departamento'},
            {model:models.usuario,as:'usuario'},{model:models.usuario,as:'jefeProyecto'},
            {model:models.usuario, as:'usuarioBp' },{model:models.etapaProyecto, as:'etapa' },
            {model:models.parametros, as:'complejidad' },
            {model:models.parametros, as:'saludProyecto' },
            {model:models.parametros, as:'tProyecto' },
            {model:models.proyectoAdjunto, as:'adjunto',include:[{model:models.parametros,as:'tipoAdjunto' }]  },
            {model:models.entregableProyecto, as:'entregableProyecto',include:[{model:models.parametros,as:'tipoEntregable' }]  },
            {model:models.estadoProyecto, as:'estadoProyecto' },
            {model:models.equipoProyecto, as:'equipoProyecto', include:[{model:models.parametros,as:'cargo'}] },
            ]


    }).success(function(proyecto) {

        return res.json(200, proyecto);

    });
}


exports.porDp = function(req, res) {
models.bpEmpresa.find({where:{
        idDirector:req.params.id

    }}).success(function(x){



    models.proyecto.findAll({where:{
        idBp: x.usuarioId

    },
        include :[{model:models.empresa, as :'empresa'},{model:models.departamento,as:'departamento'},
            {model:models.usuario,as:'usuario'},{model:models.usuario,as:'jefeProyecto'},
            {model:models.usuario, as:'usuarioBp' },{model:models.etapaProyecto, as:'etapa' },
            {model:models.parametros, as:'complejidad' },
            {model:models.parametros, as:'saludProyecto' },
            {model:models.parametros, as:'tProyecto' },
            {model:models.proyectoAdjunto, as:'adjunto',include:[{model:models.parametros,as:'tipoAdjunto' }]  },
            {model:models.entregableProyecto, as:'entregableProyecto',include:[{model:models.parametros,as:'tipoEntregable' }]  },
            {model:models.estadoProyecto, as:'estadoProyecto' },
            {model:models.equipoProyecto, as:'equipoProyecto', include:[{model:models.parametros,as:'cargo'}] },
        ]

    }).success(function(proyecto) {

        return res.json(200, proyecto);

    })



});


}


exports.verIniciativa = function(req, res) {

    models.proyecto.find({where:{
        idEtapaProyecto:1,
        idEstadoProyecto:1,
        idProyecto:req.params.id
    },

        include :[{model:models.empresa, as :'empresa'},{model:models.departamento,as:'departamento'},
            {model:models.usuario,as:'usuario'},{model:models.usuario,as:'jefeProyecto'},
            {model:models.usuario, as:'usuarioBp' },{model:models.etapaProyecto, as:'etapa' },
            {model:models.estadoProyecto, as:'estadoProyecto' }]

    }).success(function(proyecto) {


        return res.status(200).json(proyecto);


    });
}


exports.crearPreEvaluacion = function (req,res ){

    // primero buscar



    models.proyecto.find({where:{idProyecto:req.body.proyecto.idProyecto,idEtapaProyecto:1}
        , include :[{model:models.empresa, as :'empresa'},{model:models.departamento,as:'departamento'},
            {model:models.usuario,as:'usuario'},{model:models.usuario,as:'jefeProyecto'},
            {model:models.usuario, as:'usuarioBp' },{model:models.etapaProyecto, as:'etapa' },
            {model:models.parametros, as:'complejidad' },
            {model:models.parametros, as:'saludProyecto' },
            {model:models.parametros, as:'tProyecto' },
            {model:models.proyectoAdjunto, as:'adjunto',include:[{model:models.parametros,as:'tipoAdjunto' }]  },
            {model:models.entregableProyecto, as:'entregableProyecto',include:[{model:models.parametros,as:'tipoEntregable' }]  },
            {model:models.estadoProyecto, as:'estadoProyecto' },
            {model:models.equipoProyecto, as:'equipoProyecto', include:[{model:models.parametros,as:'cargo'}] },
            {model:models.versiones, as:'version',attributes:['idVersion','fechaCreacion','idProyecto'], include:[{model:models.etapaProyecto,as:'etapaProyecto'}] },
            {model:models.historialProyecto, as:'historial', include:[{model:models.usuario,as:'usuario'},{model:models.etapaProyecto,as:'etapa'},{model:models.estadoProyecto,as:'estadoProyecto'}] }]

    }).success(function(proyecto){



        if  (req.body.proyecto.estadoProyecto.idEstadoProyecto ==2){
            proyecto.idEstadoProyecto =2
            proyecto.idUsuario = req.body.proyecto.idUsuario;
            versionProyecto.crearVersion(proyecto)
            proyecto.idEtapaProyecto = 2;
            proyecto.idEstadoProyecto =4

        }
        else
            proyecto.idEstadoProyecto =2

        proyecto.idJefeProyecto = req.body.proyecto.idJefeProyecto

        proyecto.save(['idEstadoProyecto','idEtapaProyecto','idJefeProyecto']).success(function(p){

            var historial ={}
            historial.idProyecto = proyecto.idProyecto;
            historial.usuarioId=req.body.proyecto.idUsuario;
            historial.idEtapaProyecto= 1;
            historial.idEstadoProyecto = req.body.proyecto.estadoProyecto.idEstadoProyecto;
            historial.descripcion  =req.body.proyecto.comentarios
            historialProyecto.insertarHistorial(historial)



            return res.json(200, proyecto);
            //Crear Version

        })



    })



}




exports.crearEjecucion = function (req,res ){

    // primero buscar



    models.proyecto.find({where:{idProyecto:req.body.proyecto.idProyecto,idEtapaProyecto:3,idEstadoProyecto:12}
        ,include :[{model:models.empresa, as :'empresa'},{model:models.departamento,as:'departamento'},
            {model:models.usuario,as:'usuario'},{model:models.usuario,as:'jefeProyecto'},
            {model:models.usuario, as:'usuarioBp' },{model:models.etapaProyecto, as:'etapa' },
            {model:models.parametros, as:'complejidad' },
            {model:models.parametros, as:'saludProyecto' },
            {model:models.parametros, as:'tProyecto' },
            {model:models.proyectoAdjunto, as:'adjunto',include:[{model:models.parametros,as:'tipoAdjunto' }]  },
            {model:models.entregableProyecto, as:'entregableProyecto',include:[{model:models.parametros,as:'tipoEntregable' }]  },
            {model:models.estadoProyecto, as:'estadoProyecto' },
            {model:models.equipoProyecto, as:'equipoProyecto', include:[{model:models.parametros,as:'cargo'}] },
            {model:models.versiones, as:'version',attributes:['idVersion','fechaCreacion','idProyecto'], include:[{model:models.etapaProyecto,as:'etapaProyecto'}] },
            {model:models.historialProyecto, as:'historial', include:[{model:models.usuario,as:'usuario'},{model:models.etapaProyecto,as:'etapa'},{model:models.estadoProyecto,as:'estadoProyecto'}] }]

    }).success(function(proyecto){



        if  (req.body.proyecto.estadoProyecto.idEstadoProyecto ==12){
            proyecto.idEstadoProyecto =12
            proyecto.idUsuario = req.body.proyecto.idUsuario;
            versionProyecto.crearVersion(proyecto)
            proyecto.idEtapaProyecto = 4;
            proyecto.idEstadoProyecto =11

        }
        else
            proyecto.idEstadoProyecto =12

        // proyecto.idJefeProyecto = req.body.proyecto.idJefeProyecto

        proyecto.save(['idEstadoProyecto','idEtapaProyecto']).success(function(p){

            var historial ={}
            historial.idProyecto = proyecto.idProyecto;
            historial.usuarioId=req.body.proyecto.idUsuario;
            historial.idEtapaProyecto= 4;
            historial.idEstadoProyecto = req.body.proyecto.estadoProyecto.idEstadoProyecto;
            historial.descripcion  =req.body.proyecto.comentarios
            historialProyecto.insertarHistorial(historial)



            return res.json(200, proyecto);
            //Crear Version

        })



    })



}

exports.crearEvaluacion = function (req,res ){

    // primero buscar



    models.proyecto.find({where:{idProyecto:req.body.proyecto.idProyecto,idEtapaProyecto:2}
        ,include :[{model:models.empresa, as :'empresa'},{model:models.departamento,as:'departamento'},
            {model:models.usuario,as:'usuario'},{model:models.usuario,as:'jefeProyecto'},
            {model:models.usuario, as:'usuarioBp' },{model:models.etapaProyecto, as:'etapa' },
            {model:models.parametros, as:'complejidad' },
            {model:models.parametros, as:'saludProyecto' },
            {model:models.parametros, as:'tProyecto' },
            {model:models.proyectoAdjunto, as:'adjunto',include:[{model:models.parametros,as:'tipoAdjunto' }]  },
            {model:models.entregableProyecto, as:'entregableProyecto',include:[{model:models.parametros,as:'tipoEntregable' }]  },
            {model:models.estadoProyecto, as:'estadoProyecto' },
            {model:models.equipoProyecto, as:'equipoProyecto', include:[{model:models.parametros,as:'cargo'}] },
            {model:models.versiones, as:'version',attributes:['idVersion','fechaCreacion','idProyecto'], include:[{model:models.etapaProyecto,as:'etapaProyecto'}] },
            {model:models.historialProyecto, as:'historial', include:[{model:models.usuario,as:'usuario'},{model:models.etapaProyecto,as:'etapa'},{model:models.estadoProyecto,as:'estadoProyecto'}] }]

    }).success(function(proyecto){



        if  (req.body.proyecto.estadoProyecto.idEstadoProyecto ==6){
            proyecto.idEstadoProyecto =6
            proyecto.idUsuario = req.body.proyecto.idUsuario;
            versionProyecto.crearVersion(proyecto)
            proyecto.idEtapaProyecto = 3;
            proyecto.idEstadoProyecto =8

        }
        else
            proyecto.idEstadoProyecto =6

       // proyecto.idJefeProyecto = req.body.proyecto.idJefeProyecto

        proyecto.save(['idEstadoProyecto','idEtapaProyecto']).success(function(p){

            var historial ={}
            historial.idProyecto = proyecto.idProyecto;
            historial.usuarioId=req.body.proyecto.idUsuario;
            historial.idEtapaProyecto= 3;
            historial.idEstadoProyecto = req.body.proyecto.estadoProyecto.idEstadoProyecto;
            historial.descripcion  =req.body.proyecto.comentarios
            historialProyecto.insertarHistorial(historial)



            return res.json(200, proyecto);
            //Crear Version

        })



    })



}
exports.index = function(req, res) {

    models.proyecto.find({where:{idProyecto:req.params.id},
        include :[{model:models.empresa, as :'empresa'},{model:models.departamento,as:'departamento'},
            {model:models.usuario,as:'usuario'},{model:models.usuario,as:'jefeProyecto'},
            {model:models.usuario, as:'usuarioBp' },{model:models.etapaProyecto, as:'etapa' },
            {model:models.parametros, as:'complejidad' },
            {model:models.parametros, as:'saludProyecto' },
            {model:models.parametros, as:'tProyecto' },
            {model:models.proyectoAdjunto, as:'adjunto',include:[{model:models.parametros,as:'tipoAdjunto' }]  },
            {model:models.entregableProyecto, as:'entregableProyecto',include:[{model:models.parametros,as:'tipoEntregable' }]  },
            {model:models.estadoProyecto, as:'estadoProyecto' },
            {model:models.equipoProyecto, as:'equipoProyecto', include:[{model:models.parametros,as:'cargo'}] },
            {model:models.versiones, as:'version',attributes:['idVersion','fechaCreacion','idProyecto'], include:[{model:models.etapaProyecto,as:'etapaProyecto'}] },
            {model:models.historialProyecto, as:'historial', include:[{model:models.usuario,as:'usuario'},{model:models.etapaProyecto,as:'etapa'},{model:models.estadoProyecto,as:'estadoProyecto'}] }]

    }).success(function(proyecto) {

        return res.json(200, proyecto);

    });
}

exports.verProyectoEmail = function(req, res) {

    console.log(req.params.id);
    models.equipoProyecto.find({where:{uid:req.params.id,estadoAutorizacion:0}}).success(function(x){

console.log(x);
    models.proyecto.find({where:{idProyecto: x.idProyecto},
        include :[{model:models.empresa, as :'empresa'},{model:models.departamento,as:'departamento'},
            {model:models.usuario,as:'usuario'},{model:models.usuario,as:'jefeProyecto'},
            {model:models.usuario, as:'usuarioBp' },{model:models.etapaProyecto, as:'etapa' },
            {model:models.parametros, as:'complejidad' },
            {model:models.parametros, as:'saludProyecto' },
            {model:models.parametros, as:'tProyecto' },
            {model:models.proyectoAdjunto, as:'adjunto',include:[{model:models.parametros,as:'tipoAdjunto' }]  },
            {model:models.entregableProyecto, as:'entregableProyecto',include:[{model:models.parametros,as:'tipoEntregable' }]  },
            {model:models.estadoProyecto, as:'estadoProyecto' },
            {model:models.equipoProyecto, as:'equipoProyecto', include:[{model:models.parametros,as:'cargo'}] },
            {model:models.versiones, as:'version',attributes:['idVersion','fechaCreacion','idProyecto'], include:[{model:models.etapaProyecto,as:'etapaProyecto'}] },
            {model:models.historialProyecto, as:'historial', include:[{model:models.usuario,as:'usuario'},{model:models.etapaProyecto,as:'etapa'},{model:models.estadoProyecto,as:'estadoProyecto'}] }]

    }).success(function(proyecto) {

        return res.json(200, proyecto);

    });

    })
}


exports.enviarAprobacion= function (req,res){
    // buscar  Proyecto

    models.proyecto.find({where:{idProyecto:req.body.proyecto.idProyecto}}).success(function(proyecto) {

        proyecto.nombre=req.body.proyecto.nombre;
        proyecto.resumenEjecutivo = req.body.proyecto.resumenEjecutivo;
        proyecto.fechaEstimadaComienzo =req.body.proyecto.fechaEstimadaComienzo;
        proyecto.duracionSemana = req.body.proyecto.duracionSemana;

            proyecto.idComplejidad = req.body.proyecto.idComplejidad;
        proyecto.tipoProyecto = req.body.proyecto.tipoProyecto;
        proyecto.costoOneOff = req.body.proyecto.costoOneOff;
        proyecto.costoOnGoing =req.body.proyecto.costoOnGoing;
        proyecto.beneficios =req.body.proyecto.beneficios;
        proyecto.beneficioIntangible  =  req.body.proyecto.beneficioIntangible;


        var estadoNuevo ={}


        switch(proyecto.idEtapaProyecto) {
            case 2:
                estadoNuevo.idEstadoProyecto = 5
                estadoNuevo.idEtapaProyecto = 2

                break;
            case 3:
                estadoNuevo.idEstadoProyecto = 9
                estadoNuevo.idEtapaProyecto = 3
                break;

        }



        proyecto.idEstadoProyecto  =  estadoNuevo.idEstadoProyecto;


        proyecto.save().success(function(x){

            var historial ={}
            historial.idProyecto = x.idProyecto;
            historial.usuarioId=req.body.proyecto.usuarioLogin;
            historial.idEstadoProyecto= x.idEstadoProyecto;
            historial.idEtapaProyecto = x.idEtapaProyecto;
            historial.descripcion  ='Documento Enviado Aprobacion';
            historialProyecto.insertarHistorial(historial)



            if (estadoNuevo.idEstadoProyecto==9)
                agregarEntregable(req.body.proyecto);
            agregarEquipo(req.body.proyecto, mailer.enviarEmailMasivo)
            //mailer.EnvioEmail(1,req.body.proyecto)


            return res.json(200, x);

        })



    })

}



function agregarEquipo(req,callback){

    var equipoProyecto=[]

    for (var i=0;i<=req.equipoProyecto.length-1;i++){
        var aprobador = {}
        aprobador.idProyecto = req.idProyecto
        aprobador.email = req.equipoProyecto[i].email
        aprobador.nombre =req.equipoProyecto[i].nombre
        aprobador.idRol = req.equipoProyecto[i].cargo.id;
        aprobador.idEtapaProyecto =req.idEtapaProyecto;
        aprobador.estadoAutorizacion=0;
        aprobador.uid =  uid.v4();
        aprobador.hh =  req.equipoProyecto[i].hh;
        equipoProyecto.push(aprobador);
    }



    models.equipoProyecto.destroy({where:{idProyecto:req.idProyecto} }).success(function(equipo) {

        models.equipoProyecto.bulkCreate(equipoProyecto).success(function(x){


            models.equipoProyecto.findAll({where:{idProyecto:req.idProyecto},include:[{model:models.parametros,as:'cargo'}]}).success(function(p){
                req.equipoProyecto = p


                //Armar arreglo con usuarios
                var users = [];
                for (var i =0;i<= p.length-1;i++){

                    var user = {};
                    user.email = p[i].email
                    user.subject = 'Nueva Solciitud de Aprobacion'
                    user.nombreUsuario = p[i].nombre;
                    user.cargo = p[i].cargo.nombre;
                    user.nombreProyecto = req.nombre;
                    user.etapaProyecto=req.etapa.nombre;
                    user.fechaEnvio = new Date();
                    user.llave = config.rutaAprobacion + p[i].uid;
                users.push(user);
                }

                if (callback !==undefined)
                    callback(users,'solicitarAprobacion')

            })


        })


    });

}

function agregarEntregable(req){

    var entregableProyecto=[]
console.log(req.entregableProyecto.length)

    for (var i=0;i<=req.entregableProyecto.length-1;i++){
        console.log(i)
        var fechaEstimada = new Date( req.fechaEstimadaComienzo);
        fechaEstimada.setDate(fechaEstimada.getDate() + parseInt(req.entregableProyecto[i].semanaEntrega)*7)

        var entregable = {}
        entregable.idProyecto = req.idProyecto
        entregable.idTipoEntregable =  req.entregableProyecto[i].tipoEntregable.id;
        entregable.semanaEntrega =req.entregableProyecto[i].semanaEntrega
        entregable.fechaEstimada = fechaEstimada;
        entregable.estado=0;
        entregableProyecto.push(entregable);
    }



    models.entregableProyecto.destroy({where:{idProyecto:req.idProyecto} }).success(function(entregable) {

        models.entregableProyecto.bulkCreate(entregableProyecto).success(function(x){





        })


    });

}


exports.pruebaEmail = function (req,res){

    mailer.enviarPrueba();



}


exports.aprobarProyecto= function (req,res){

    models.equipoProyecto.find({where:{uid:req.body.aprobador.id,estadoAutorizacion:0}}).success(function(equipo){

        equipo.estadoAutorizacion=req.body.aprobador.estado;

        equipo.fechaAutorizacion= new Date();

        equipo.save(['estadoAutorizacion','fechaAutorizacion']).success(function(x){


            var historial ={}
            historial.idProyecto = x.idProyecto;

            historial.idEstadoProyecto= x.idEstadoProyecto;
            historial.idEtapaProyecto = x.idEtapaProyecto;
            historial.descripcion  ='El usuario ' + equipo.nombre;
            historialProyecto.insertarHistorial(historial)


            var estadoNuevo ={}

        if (req.body.aprobador.estado==2)
            switch(x.idEtapaProyecto) {
                case 2:
                    estadoNuevo.idEstadoProyecto = 7
                    estadoNuevo.idEtapaProyecto = x.idEtapaProyecto

                    break;
                case 3:
                    estadoNuevo.idEstadoProyecto = 13
                    estadoNuevo.idEtapaProyecto = x.idEtapaProyecto
                    break;

            }
        else
            switch(x.idEtapaProyecto) {
                case 2:
                    estadoNuevo.idEstadoProyecto = 6
                    estadoNuevo.idEtapaProyecto = x.idEtapaProyecto

                    break;
                case 3:
                    estadoNuevo.idEstadoProyecto = 12
                    estadoNuevo.idEtapaProyecto = x.idEtapaProyecto
                    break;

            }





            cambiarEstadoProyecto(x,estadoNuevo)



            return res.json(200, x);
        })

    })


}


function cambiarEstadoProyecto(req,estado){

    models.equipoProyecto.findAll({where:{idProyecto:req.idProyecto,estadoAutorizacion:0,
        idEtapaProyecto:req.idEtapaProyecto
    }}).success(function(e){

        if (e.length ==0)
        {
            models.proyecto.find({where:{idProyecto:req.idProyecto},
                include :[{model:models.empresa, as :'empresa'},{model:models.departamento,as:'departamento'},
                    {model:models.usuario,as:'usuario'},{model:models.usuario,as:'jefeProyecto'},
                    {model:models.usuario, as:'usuarioBp' },{model:models.etapaProyecto, as:'etapa' },
                    {model:models.parametros, as:'complejidad' },
                    {model:models.proyectoAdjunto, as:'adjunto',include:[{model:models.parametros,as:'tipoAdjunto' }]  },
                    {model:models.estadoProyecto, as:'estadoProyecto' },
                    {model:models.equipoProyecto, as:'equipoProyecto', include:[{model:models.parametros,as:'cargo'}] },
                ]

            }).success(function (x){



                versionProyecto.crearVersion(x)
                x.idEtapaProyecto = estado.idEtapaProyecto;
                x.idEstadoProyecto = estado.idEstadoProyecto;
                var fechaEstimada = new Date( x.fechaEstimadaComienzo);
                fechaEstimada.setDate(fechaEstimada.getDate() + parseInt(x.duracionSemana)*7)


                x.fechaEstimadaCierre = fechaEstimada


                x.save(['idEstadoProyecto','idEtapaProyecto','fechaEstimadaCierre']).success(function(p){



                });

            })
        }

    })


}


exports.actualizarAvance= function (req,res){
    // buscar  Proyecto

    models.proyecto.find({where:{idProyecto:req.body.proyecto.idProyecto}}).success(function(proyecto) {


        proyecto.idSaludProyecto = req.body.proyecto.idSaludProyecto;
        proyecto.comentarioAvance = req.body.proyecto.comentarioAvance;
        proyecto.avance =req.body.proyecto.avance;
        proyecto.fechaUltimoInforme =new Date();


        proyecto.save().success(function(x){

            var historial ={}
            historial.idProyecto = x.idProyecto;
            historial.usuarioId=req.body.proyecto.usuarioLogin;
            historial.idEstadoProyecto= x.idEstadoProyecto;
            historial.idEtapaProyecto = x.idEtapaProyecto;
            historial.descripcion  ='Avance Actualizado a ' + proyecto.avance;
            historialProyecto.insertarHistorial(historial)





            return res.json(200, x);

        })



    })


}

