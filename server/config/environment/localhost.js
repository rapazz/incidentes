'use strict';

// Test specific configuration
// ===========================
module.exports = {
  // MongoDB connection options
  mongo: {
    uri: 'mongodb://localhost/workspace-test'
  },
   google: {
    GOOGLE_ID: '101371321144-dnsdurhv3vp7f8r71uo7hmaogm1p7vhg@developer.gserviceaccount.com',
    GOOGLE_SECRET: 'KWskkW96pnhQCcEaVynqfr2T',
    DOMAIN: 'http://localhost:9000'
  },
  mysql: {
    dialect:'mysql',
    port: 3306,
    user: 'root',
    password:'palenrafe',
    database:'incidentes'
  
},
mailer: {
  host:'172.20.1.125',
  port:25,
  user:'',
  pass:'',
  mailDefecto: 'informatica@kcl.cl'
  
  
},
baseUsuarios:{
    host: '54.187.191.158',
    header:'',
    type:'kcc',
    index:'contactos'
},
rutaAdjunto:{ 
  url:'archivos'
  
},
rutaAprobacion:"http://localhost:9000/#/ext/proyecto/aprobacion/"
}
