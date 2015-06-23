var nodemailer = require('nodemailer');
var smtpTransport = require('nodemailer-smtp-transport');
var models  = require('../model');
var config = require('../../config/environment');
var path           = require('path')
    , templatesDir   = path.resolve(__dirname, '..', 'emailTemplate')
    , emailTemplates = require('email-templates')






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



exports.envioEmailIncidente = function(tipoEmail,datos) {

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
       
       cuerpoEmail = cuerpoEmail.replace(new RegExp('{{idIncidente}}', 'g'),datos.idIncidente);
       cuerpoEmail = cuerpoEmail.replace(new RegExp('{{nombre}}', 'g'),datos.nombre);
       
       cuerpoEmail = cuerpoEmail.replace(new RegExp('{{estadoNombre}}', 'g'), datos.estado.Nombre);
          cuerpoEmail = cuerpoEmail.replace(new RegExp('{{nombreSolicitante}}', 'g'), datos.ku.nombre);
                    cuerpoEmail = cuerpoEmail.replace(new RegExp('{{nombreConsultor}}', 'g'), datos.consultor.nombre);
       cuerpoEmail = cuerpoEmail.replace(new RegExp('{{aprobar}}', 'g'), url +'/niciativa/editar/' + datos.idProyecto);
          cuerpoEmail = cuerpoEmail.replace(new RegExp('{{linkAprobacion}}', 'g'), url +'/incidente/ver' + datos.idIncidente);
       
     //  cuerpoEmail = cuerpoEmail.replace(new RegExp('{{guid}}', 'g'), datos.equipoProyecto[i].guid);   
       
   
     var salida = {
        from: config.mailer.mailDefecto,
        to:  datos.ku.email,
       // to:  'moises.bravo@rapazz.cl',
        subject: x.asunto  + ' ' +datos.idIncidente,
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





// Ejemplo de USO

exports.enviarPrueba = function(){

    emailTemplates(templatesDir, function(err, template) {

        if (err) {
            console.log(err);
        } else {

            // ## Send a single email

            // Prepare nodemailer transport object
            var transport = nodemailer.createTransport(smtpTransport({
                service: "Gmail",
                auth: {
                    user: 'moises.bravo@rapazz.cl',
                    pass: 'P1lenrafe'
                }
            }));

            // An example users object with formatted email function
            var locals = {
                email: 'moises.bravo@rapazz.cl',
                name: {
                    first: 'Mamma',
                    last: 'Mia'
                }
            };

            // Send a single email
            template('solicitarAprobacion', locals, function(err, html, text) {
                if (err) {
                    console.log(err);
                } else {
                    transport.sendMail({
                        from: 'Spicy Meatball <spicy.meatball@spaghetti.com>',
                        to: locals.email,
                        subject: 'Mangia gli spaghetti con polpette!',
                        html: html,
                        // generateTextFromHTML: true,
                        text: text
                    }, function(err, responseStatus) {
                        if (err) {
                            console.log(err);
                        } else {
                            console.log(responseStatus.message);
                        }
                    });
                }
            });




        }
    });




}


exports.enviarEmailMasivo = function(users,templateEmail){

    console.log('saS')
    emailTemplates(templatesDir, function(err, template) {

        if (err) {
            console.log(err);
        } else {
console.log ('SIII')
//configura  correo.
            var transport = nodemailer.createTransport(smtpTransport({
                service: "Gmail",
                auth: {
                    user: 'moises.bravo@rapazz.cl',
                    pass: 'P1lenrafe'
                }
            }));

            var Render = function (locals) {
                this.locals = locals;
                this.send = function (err, html, text) {
                    if (err) {
                        console.log(err);
                    } else {
                        transport.sendMail({
                            from: config.mailer.mailDefecto,
                            to: locals.email,
                            subject: locals.subject,
                            html: html

                        }, function (err, responseStatus) {
                            if (err) {
                                console.log(err);
                            } else {
                                console.log(responseStatus.message);
                            }
                        });
                    }
                };
                this.batch = function (batch) {
                    batch(this.locals, templatesDir, this.send);
                };
            };

            //Envia Correo
            template(templateEmail, true, function (err, batch) {
                for (var user in users) {
                    var render = new Render(users[user]);
                    render.batch(batch);
                }
            });
        }
    });
}

