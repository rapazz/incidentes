
var clients = require('./variables.js');
module.exports = function (io) {
  'use strict';

  io.on('connection', function (socket) {
        
    console.log('usuario conectado ' + socket.id)
  
socket.on('registarUsuario', function(data){
     clients.add(data.usuarioId, socket);
  });    
   
  
  
    
  });
  
  

};