'use strict';

// Development specific configuration
// ==================================
module.exports = {
  google: {
    GOOGLE_ID: '101371321144-019sr810rr5vocuk44b06qmlmj0q6qa0.apps.googleusercontent.com',
    GOOGLE_SECRET: 'Lr63zDP-aTjodV7dKtQ1SIRM',
    DOMAIN: 'http://plantillanueva-rapazz.c9.io/'
  },
   elasticsearch:{
    host:'54.187.191.158',
    index:'contactos',
    type:'kcc'
  },
  mysql: {
    dialect:'mysql',
    port: 3306,
    user: 'rapazz',
    password:'',
    database:'c9'
  
},
mailer: {
  host:'email-smtp.us-east-1.amazonaws.com',
  service:"Gmail",
  port:2588,
  user:'moises.bravo@rapazz.cl',
  pass:'P1lenrafe',
  mailDefecto: 'moises.bravo@rapazz.cl'
  
  
},
rutaAdjunto:{ 
  url:'archivos'
  
}
};
