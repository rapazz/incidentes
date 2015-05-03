var nodemailer = require('nodemailer');
var smtpTransport = require('nodemailer-smtp-transport');
var models  = require('../model');
var config = require('../../config/environment');
var moment = require('moment');



 function enviarEmail(x){
    

var transport = nodemailer.createTransport(smtpTransport({
        service: "Gmail",
          auth: {
          user: config.mailer.user,
          pass: config.mailer.pass
        }
      }));
    
 var salida = {
        from: config.mailer.mailDefecto,
        to:  x.to,
        subject: x.subject,
        html: x.body
      }

  transport.sendMail(salida, function(error, response){  //callback
        if(error){
          console.log(error);
        }else{
          console.log("Message sent: " + response.message);
        }

     
      });     
}


exports.enviarPrueba = function(){
  
var transport = nodemailer.createTransport(smtpTransport({
        service: "Gmail",
          auth: {
          user: 'moises.bravo@rapazz.cl',
          pass: 'P1lenrafe'
        }
      }));

    
    
     var salida = {
        from:'moises.bravo@rapazz.cl',
        to:  'moises.bravo@kcl.cl',
       // to:  'moises.bravo@rapazz.cl',
        subject: 'prueba de correo',
        html: '<b>hola Mundo </b>'
      }
      
      transport.sendMail(salida, function(error, response){  //callback
        if(error){
          console.log(error);
        }else{
          console.log("Message sent: " + response.message);
        }

     
      });    
    
}




exports.EnvioEmail = function(tipoEmail,datos) {

models.emailTemplate.find ({where:{idTemplate:tipoEmail}}).success(function(x){
  
//generaro lista de usuarios 
// igualo campos a valores 

var transport = nodemailer.createTransport(smtpTransport({
        host: config.mailer.host,
        port: config.mailer.port,
        service: "Gmail",
          auth: {
          user: config.mailer.user,
          pass: config.mailer.pass
        }
      }));
var url = 'http://sistemagestion-rapazz.c9.io/#/proyecto'
   for ( var i=0;i<=datos.equipoProyecto.length-1;i++) {
        var cuerpoEmail = x.cuerpo 
       
       cuerpoEmail = cuerpoEmail.replace(new RegExp('{{nombreProyecto}}', 'g'),datos.nombre);
       cuerpoEmail = cuerpoEmail.replace(new RegExp('{{rolUsuario}}', 'g'), datos.equipoProyecto[i].cargo.nombre);
       cuerpoEmail = cuerpoEmail.replace(new RegExp('{{nombreUsuario}}', 'g'), datos.equipoProyecto[i].nombre);
       
       cuerpoEmail = cuerpoEmail.replace(new RegExp('{{linkAprobacion}}', 'g'), url +'/aprobacionEmail/' + datos.equipoProyecto[i].uid);
           cuerpoEmail = cuerpoEmail.replace(new RegExp('{{aprobar}}', 'g'), url +'/aprobacionEmail/a/' + datos.equipoProyecto[i].uid);
           cuerpoEmail = cuerpoEmail.replace(new RegExp('{{rechazar}}', 'g'), url +'/aprobacionEmail/r/' + datos.equipoProyecto[i].uid);
     
       
     //  cuerpoEmail = cuerpoEmail.replace(new RegExp('{{guid}}', 'g'), datos.equipoProyecto[i].guid);   
       
   
     var salida = {
        from:config.mailer.mailDefecto,
        to:  datos.equipoProyecto[i].email,
       // to:  'moises.bravo@rapazz.cl',
        subject: x.asunto  + ' ' +datos.idProyecto,
        html: cuerpoEmail
      }
      
      transport.sendMail(salida, function(error, response){  //callback
        if(error){
          console.log(error);
        }else{
          console.log("Message sent: " + response.message);
        }

     
      });
   
   //  smtpTransport.close(); // shut down the connection pool, no more messages.  Comment this line out to continue sending emails.
   
   
   }
    
    
    
})



};



exports.emailNuevoIncidente = function(datos){
 models.emailTemplate.find ({where:{idTemplate:5}}).success(function(x){
     
     console.log(config.root)
   var linkIncidente = 'http://plantillanueva-rapazz.c9.io/#/app/incidentes/verIncidente/' +datos.idIncidente
    var cuerpoEmail = x.cuerpo 
     cuerpoEmail = cuerpoEmail.replace(new RegExp('{{nombreUsuario}}', 'g'),datos.ku.nombre);
     cuerpoEmail = cuerpoEmail.replace(new RegExp('{{fechaCreacion}}', 'g'),moment(datos.fechaCreacion).zone('-03:00').format('DD-MM-YYYY H:mm a'));
          cuerpoEmail = cuerpoEmail.replace(new RegExp('{{SLA}}', 'g'),datos.sla);
    cuerpoEmail = cuerpoEmail.replace(new RegExp('{{idIncidente}}', 'g'),datos.idIncidente);
    cuerpoEmail = cuerpoEmail.replace(new RegExp('{{nombre}}', 'g'),datos.nombre); 
      cuerpoEmail = cuerpoEmail.replace(new RegExp('{{linkIncidente}}', 'g'),linkIncidente); 
      cuerpoEmail = cuerpoEmail.replace(new RegExp('{{urlSite}}', 'g'),'http://plantillanueva-rapazz.c9.io'); 

    var datosUsuario = {}
    
    datosUsuario.to = datos.ku.email
    datosUsuario.subject = x.asunto
    datosUsuario.body = cuerpoEmail
     
 
  
  enviarEmail(datosUsuario);    
     
 });   

}

exports.emailAsignarConsultorIncidente = function(datos){
 models.emailTemplate.find ({where:{idTemplate:6}}).success(function(x){
     
   var linkIncidente = 'http://plantillanueva-rapazz.c9.io/#/app/incidentes/verIncidente/' +datos.idIncidente
    var cuerpoEmail = x.cuerpo 
     cuerpoEmail = cuerpoEmail.replace(new RegExp('{{nombreUsuario}}', 'g'),datos.ku.nombre);
      cuerpoEmail = cuerpoEmail.replace(new RegExp('{{nombreConsultor}}', 'g'),datos.consultor.nombre); 
    cuerpoEmail = cuerpoEmail.replace(new RegExp('{{idIncidente}}', 'g'),datos.idIncidente);
    cuerpoEmail = cuerpoEmail.replace(new RegExp('{{nombre}}', 'g'),datos.nombre); 
      cuerpoEmail = cuerpoEmail.replace(new RegExp('{{linkIncidente}}', 'g'),linkIncidente); 
      cuerpoEmail = cuerpoEmail.replace(new RegExp('{{urlSite}}', 'g'),'http://plantillanueva-rapazz.c9.io'); 

    var datosUsuario = {}
    
    datosUsuario.to = datos.ku.email
    datosUsuario.subject = x.asunto
    datosUsuario.body = cuerpoEmail
     
 
  
  enviarEmail(datosUsuario);    
     
 });   

}


exports.EnvioEmailIniciativa = function(tipoEmail,datos) {

models.emailTemplate.find ({where:{idTemplate:tipoEmail}}).success(function(x){
    



//generaro lista de usuarios 
// igualo campos a valores 

var transport = nodemailer.createTransport(smtpTransport({
        host: config.mailer.host,
        port: config.mailer.port,

          auth: {
          user: config.mailer.user,
          pass: config.mailer.pass
        }
      }));
var url = 'http://sistemagestion-rapazz.c9.io/#/'
  
        var cuerpoEmail = x.cuerpo 
       
       cuerpoEmail = cuerpoEmail.replace(new RegExp('{{nombreProyecto}}', 'g'),datos.nombre);
       cuerpoEmail = cuerpoEmail.replace(new RegExp('{{nombreEmpresa}}', 'g'),datos.empresa.nombre);
       
       cuerpoEmail = cuerpoEmail.replace(new RegExp('{{nombreUsuario}}', 'g'), datos.usuarioBp.nombre);
          cuerpoEmail = cuerpoEmail.replace(new RegExp('{{nombreSolicitante}}', 'g'), datos.usuario.nombre);
       cuerpoEmail = cuerpoEmail.replace(new RegExp('{{aprobar}}', 'g'), url +'/niciativa/editar/' + datos.idProyecto);
         
       
     //  cuerpoEmail = cuerpoEmail.replace(new RegExp('{{guid}}', 'g'), datos.equipoProyecto[i].guid);   
       
   
     var salida = {
        from: config.mailer.mailDefecto,
        to:  datos.usuarioBp.email,
       // to:  'moises.bravo@rapazz.cl',
        subject: x.asunto  + ' ' +datos.idProyecto,
        html: cuerpoEmail
      }
      
      transport.sendMail(salida, function(error, response){  //callback
        if(error){
          console.log(error);
        }else{
          console.log("Message sent: " + response.message);
        }

     
      });
   
   //  smtpTransport.close(); // shut down the connection pool, no more messages.  Comment this line out to continue sending emails.
   
   
   
    
    
    
})



};



