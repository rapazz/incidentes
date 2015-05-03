var models  = require('../model');
var express = require('express');
var historial = require('./incidenteHistorial');
//var adjunto = require('./adjunto');
var mailer= require('./mailer');
var moment = require('moment');
var uid = require("node-uuid");
var clients = require('../sockets/variables.js');
var Sequelize = require("sequelize");





exports.estatusActual=function(req,res){
    var dashboard ={};
    
    models.usuario.findAll({where:["rolesMenu like ?", '%30%'],attributes: ['usuarioId', 'nombre']
 
 } ).success(function(usuario) {


    models.incidente.findAll({
         attributes: [[Sequelize.fn('COUNT', Sequelize.col('idIncidente')),'count'],
         'idusuarioConsultor'
         ],
         group: 'idusuarioConsultor'
    }
        ).success(function(indicadores){
            
      
        var resultadoArray = [];
        var sinAsignar = 0
            for (var i=0;i<=usuario.length-1;i++)
            {
                 var resultado = {}
                 resultado.consultor=usuario[i];
                 var encontro = 0
                 
             for (var x=0;x<=indicadores.length-1;x++)
             {
               console.log(indicadores[x].dataValues.idusuarioConsultor)
                 if (indicadores[x].dataValues.idusuarioConsultor==-1)
                 {
                     encontro=1;
                       sinAsignar = indicadores[x].dataValues.count 
                         
                       
                 }
                 else 
                 if (indicadores[x].dataValues.idusuarioConsultor==usuario[i].dataValues.usuarioId)
                    {
                        console.log(indicadores[x].dataValues.count)
                        encontro=1;
                        resultado.count = indicadores[x].dataValues.count 
                         
                        x= indicadores.length;
                    }
             }
              if  (encontro ==0)
               resultado.count =0;
              resultadoArray.push(resultado)
              
              
            }
            if (sinAsignar>0)
            {
              var resultado = {}
              resultado.consultor = null;
              resultado.count =sinAsignar;
               resultadoArray.push(resultado)
        }
            return res.json(200, resultadoArray); 
            
        })
    
 });
     
}

exports.incidentesPorOrigenProblema = function(req,res){
    var parametro = {}
    parametro.mes = req.body.mes;
    parametro.anno = req.body.anno;
   
    var consultaEmpresa ={} 
    if (req.body.idEmpresa !=-1)
    consultaEmpresa = {'idEmpresa':req.body.idEmpresa}

     models.indicadoresIncidentes.findAll({where:parametro,
    attributes: [[Sequelize.fn('COUNT', Sequelize.col('idIncidente')),'count'],
         'idOrigenProblema',
         'idTipoIncidente',
         ],
         group: ['idOrigenProblema','idTipoIncidente'],
         order: 'count desc',
      include :[
          {model:models.usuario,as:'ku'
       , where : Sequelize.and(consultaEmpresa)     
          }, {model:models.tipoincidente,as:'tipoincidente'},
           {model:models.origenproblema,as:'origenproblema'}]    
    }).success(function(x) {

 var j=[];
 var colors =['#7266ba','#9289ca','#564aa3','#322C5B','#5C5877','#8A7DDF']
 for (var i=0;i<=x.length-1;i++){
     var g = x[i].idOrigenProblema
     
    if ( typeof  j[g] == "undefined")
    {
      var t={};   
    t.label=x[i].origenproblema.Nombre
    t.color=colors[i];
    t.data=[]
    j[g] = t; 
    }
    
 }
 
 for (var i=0;i<=x.length-1;i++){
      var g = x[i].idOrigenProblema
var h =[x[i].tipoincidente.Nombre,x[i].dataValues.count]
j[g].data.push(h)  
 }
 
   return   res.status(200).json(j);
  });



}


exports.incidentesPorKeyUser= function(req,res){
    var parametro = {}
    parametro.mes = req.body.mes;
    parametro.anno = req.body.anno;
   
    var consultaEmpresa ={} 
    if (req.body.idEmpresa !=-1)
    consultaEmpresa = {'idEmpresa':req.body.idEmpresa}
   
     models.indicadoresIncidentes.findAll({where:parametro,
    attributes: [[Sequelize.fn('COUNT', Sequelize.col('idIncidente')),'count'],
         'idUsuarioKU'
         ],
         group: 'idUsuarioKU',
         order: 'count desc',
      include :[
          {model:models.usuario,as:'ku'
       , where : Sequelize.and(consultaEmpresa)     
          }]    
    }).success(function(x) {
   return   res.status(200).json(x);
  });
    
}

exports.incidentesPorSistema= function(req,res){
    var parametro = {}
    parametro.mes = req.body.mes;
    parametro.anno = req.body.anno;
   
    var consultaEmpresa ={} 
    if (req.body.idEmpresa !=-1)
    consultaEmpresa = {'idEmpresa':req.body.idEmpresa}
   
     models.indicadoresIncidentes.findAll({where:parametro,
    attributes: [[Sequelize.fn('COUNT', Sequelize.col('idIncidente')),'count'],
         'idTipoIncidente'
         ],
         group: 'idTipoIncidente',
         order: 'count desc',
      include :[
         {model:models.tipoincidente,as:'tipoincidente'}
          ]    
    }).success(function(x) {
   return   res.status(200).json(x);
  });
    
}


exports.porcentajeCumplimiento = function(req,res){
    
    
    
    var parametro = {}
    parametro.mes = req.body.mes;
    parametro.anno = req.body.anno;
   
    var consultaEmpresa ={} 
    if (req.body.idEmpresa !=-1)
    consultaEmpresa = {'idEmpresa':req.body.idEmpresa}
    
    
    models.indicadoresIncidentes.findAll({where:parametro,
    attributes: [[Sequelize.fn('COUNT', Sequelize.col('idIncidente')),'count'],
     [Sequelize.fn('SUM', Sequelize.col('cumpleSLA')),'sum'],
         'idusuarioConsultor'
         ],
         group: 'idusuarioConsultor',
      include :[
          {model:models.usuario,as:'ku'
       , where : Sequelize.and(consultaEmpresa)     
          },{model:models.usuario,as:'consultor'}]    
    }).success(function(proyecto) {
   
   var totalCasos=0;
   var totalCumpleSLA=0;
   for( var i=0;i<=proyecto.length-1;i++){
      totalCasos +=proyecto[i].dataValues.count
   totalCumpleSLA +=proyecto[i].dataValues.sum 
       
   }

   var cumplimiento={}
   cumplimiento.totalCasos = totalCasos
   cumplimiento.cumpleSLA = totalCumpleSLA
   cumplimiento.porcentajeCumplimiento= 100*totalCumpleSLA/totalCasos
   cumplimiento.detalleCasos=proyecto
   
   
   
   return   res.status(200).json(cumplimiento);
   
   
  });
}

exports.incidentesKU = function(req, res) {
    
  models.incidente.findAll({where:{
      idusuarioKU:req.params.id
    
  },
      
  include :[{model:models.usuario,as:'ku'},{model:models.usuario,as:'consultor'},
  {model:models.tipoincidente, as:'tipoIncidente' },
  {model:models.subtipoincidente, as:'subtipoincidente' },
  {model:models.origenproblema, as:'origenproblema' },
  {model:models.estado, as:'estado' },
  {model:models.codigotermino, as:'codigotermino' }],
     order: '`idIncidente` DESC'
  }).success(function(proyecto) {
   
   return   res.status(200).json(proyecto);
   
   
  });
}


exports.nuevoid = function(req, res) {

  return res.json(200,   uid.v4() );
  // Incidente.find(function (err, incidentes) {
  // if(err) { return handleError(res, err); }
  // return res.json(200, incidentes);
  //});
};

exports.incidentesConsultor = function(req, res) {
    
  models.incidente.findAll({where:{
      idUsuarioConsultor:[req.params.id,-1],idEstado:{$ne:99}
    
  },
      
  include :[{model:models.usuario,as:'ku'},{model:models.usuario,as:'consultor'},
  {model:models.tipoincidente, as:'tipoIncidente' },
  {model:models.subtipoincidente, as:'subtipoincidente' },
  {model:models.origenproblema, as:'origenproblema' },
  {model:models.estado, as:'estado' },
  {model:models.codigotermino, as:'codigotermino' }]
    
  }).success(function(proyecto) {
   
   return res.json(200, proyecto);
   
  });
}

exports.incidentesSinAsignar = function(req, res) {
    
  models.incidente.findAll({where:{
      idUsuarioConsultor:-1
    
  },
      
  include :[{model:models.usuario,as:'ku'},{model:models.usuario,as:'consultor'},
  {model:models.tipoincidente, as:'tipoIncidente' },
  {model:models.subtipoincidente, as:'subtipoincidente' },
  {model:models.origenproblema, as:'origenproblema' },
  {model:models.estado, as:'estado' },
  {model:models.codigotermino, as:'codigotermino' }]
    
  }).success(function(proyecto) {
   
   return res.json(200, proyecto);
   
  });
}
exports.verIncidente = function(req, res) {
    
  models.incidente.find({where:{
      idIncidente:req.params.id
    
  },
      
  include :[{model:models.usuario,as:'ku'},{model:models.usuario,as:'consultor'},
  {model:models.tipoincidente, as:'tipoIncidente' },
  {model:models.subtipoincidente, as:'subtipoincidente' },
  {model:models.origenproblema, as:'origenproblema' },
  {model:models.estado, as:'estado' },
  {model:models.codigotermino, as:'codigotermino' },
  {model:models.adjunto, as:'adjuntos' },
  {model:models.incidenteHistorial, as:'historial',include:[{model:models.codigotermino,as:'codigotermino' },{model:models.usuario,as:'usuario' },{model:models.estado,as:'estado' }]  }
  ]
    
  }).success(function(proyecto) {
   
   // busca Diferencia en SLA
   
    
   return res.json(200, proyecto);
   
  });
}




exports.crear = function(req, res) {
  var inc = req.body;
  var idi = req.body["IdInterno"];
  var usuario = req.body["usuario"];

models.tipoincidente.find({where: {TipoIncidenteId:inc.idTipoIncidente}
  
}).success(function(y) {

  models.incidente.create({

    fechaCreacion: new Date(),
    fechaActualizacion: new Date(),
    nombre: inc.nombre,
    descripcion:  inc.descripcion,
    idUsuarioKU: inc.usuario.usuarioId,
    idUsuarioConsultor: -1,
    idSubTipoIncidente: inc.idSubTipoIncidente,
    idTipoIncidente: inc.idTipoIncidente,
    sla: y.sla,
    idEstado: 10
    

  }).success(function(x) {

      var h ={}
   h.idIncidente = x.idIncidente;
    h.usuarioId=x.idUsuarioKU;
   h.idEstado=x.idEstado;
   h.fechaCreacion =  new Date();
  h.idAccion = 1;
  historial.insertarHistorial(h)
  var j = {}
  j.idIncidente = x.idIncidente;
  j.guid = idi;
//adjunto.actualizarAdjunto(j)
//Agregar llamada a webSocket
// clients[x.idUsuarioKU].emit("hola", 'hello');


// Carga datos Incidentes.
models.incidente.find({where:{idIncidente:x.idIncidente},
  include :[{model:models.usuario,as:'ku'},
  {model:models.tipoincidente, as:'tipoIncidente' },
  {model:models.subtipoincidente, as:'subtipoincidente' },
  {model:models.estado, as:'estado' }
  ]
  }).success(function(p) {
   mailer.emailNuevoIncidente(p)
   // busca Diferencia en SLA
   
    
   
   
  });





   return res.json(200, x);

  });





})
  
};

exports.tomarIncidente = function(req, res) {

  
  var inc = req.body;
  var usuario =  inc.usuario;
 


 
  models.incidente.find({ where: {idIncidente: inc.idIncidente} }).on('success', function(t) {
    if (t) { // if the record exists in the db
      t.updateAttributes({
        fechaActualizacion: new Date(),
       idUsuarioConsultor: usuario,
        idEstado: 20,
      }).success(function(x) {

   var h ={}
   h.idIncidente = inc.idIncidente,
    h.usuarioId=usuario;
   h.idEstado=20;
   h.fechaCreacion =  new Date();
  h.idAccion = 2;
  historial.insertarHistorial(h)

// Carga datos Incidentes.
models.incidente.find({where:{idIncidente:x.idIncidente},
  include :[{model:models.usuario,as:'ku'},{model:models.usuario,as:'consultor'},
  {model:models.tipoincidente, as:'tipoIncidente' },
  {model:models.subtipoincidente, as:'subtipoincidente' },
  {model:models.estado, as:'estado' }
  ]
  }).success(function(p) {
   mailer.emailAsignarConsultorIncidente(p)
   // busca Diferencia en SLA
   
    
   
   
  });


 return res.json(200, x);
      });
    }
  })


};


exports.guardarIncidente = function(req,res){


// Valida Dependiendo e estado 


  models.incidente.find({ where: {idIncidente: req.body.idIncidente} }).on('success', function(t) {
    
    if (t) { // if the record exists in the db
    
    
    var idConsultor
    var fechaCierre
if (req.body.idEstado ==80)
 idConsultor =req.body.idConsultor;
else 
idConsultor  =t.idConsultor; 
 

if (req.body.idEstado ==99)
 fechaCierre =new Date();
else 
fechaCierre = null;
 
 
    
      t.updateAttributes({
        fechaActualizacion: new Date(),
      idOrigenProblema: req.body.idOrigenProblema,
      idTipoIncidente: req.body.idTipoIncidente,
      idSubTipoIncidente: req.body.idSubTipoIncidente,
      idCodigoTermino: req.body.idCodigoTermino,
      fechaCierre: fechaCierre,
      idUsuarioConsultor: idConsultor, 
        idEstado: req.body.idEstado,
      }).success(function(x) {

   var h ={}
   h.idIncidente = req.body.idIncidente,
    h.usuarioId=req.body.usuario.usuarioId;
    h.idCodigoTermino = req.body.idCodigoTermino; 
   h.idEstado=req.body.idEstado,
   h.fechaCreacion =  new Date();
   h.descripcion =  req.body.comentarioConsultor;
  h.idAccion =3;
  historial.insertarHistorial(h)

//verifica si se envio al key user 
//TODO: Agregar Envio de Correo-
if (req.body.idEstado ==30)
mailer.envioEmailIncidente(3,req.body)


 return res.json(200, x);
      });
    }
  })




}

exports.entregarWorkArround = function(req,res){


  models.incidente.find({ where: {idIncidente: req.body.idIncidente} }).on('success', function(t) {
    if (t) { // if the record exists in the db
      t.updateAttributes({
        fechaActualizacion: new Date(),
      idOrigenProblema: req.body.idOrigenProblema,
      idTipoIncidente: req.body.idTipoIncidente,
      idSubTipoIncidente: req.body.idSubTipoIncidente,
      idCodigoTermino: req.body.idCodigoTermino,
      comentarioConsultor: req.body.comentarioConsultor,
        idEstado: 30,
      }).success(function(x) {

   var h ={}
   h.idIncidente = req.body.idIncidente,
    h.usuarioId=req.body.usuario.usuarioId;
    h.idCodigoTermino = req.body.idCodigoTermino; 
   h.idEstado=30;
   h.fechaCreacion =  new Date();
   h.comentarios =  req.body.comentarioConsultor;
  h.idAccion =4;
  historial.insertarHistorial(h)


 return res.json(200, x);
      });
    }
  })




}