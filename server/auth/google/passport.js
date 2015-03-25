var passport = require('passport');
var GoogleStrategy = require('passport-google-oauth').OAuth2Strategy;
var elasticsearch = require('elasticsearch');
var usuario = require('../../api/controller/usuario');
exports.setup = function (User, config) {
// funcion anterior
 

passport.use(new GoogleStrategy({

      clientID: config.google.GOOGLE_ID,
      clientSecret: config.google.GOOGLE_SECRET,
      callbackURL: config.google.callbackURL
      //access_type: 'offline'
    },

  function(accessToken, refreshToken, profile, done) {
var user = usuario.buscarUsuarioEmail(profile, function(x){ 
    
     return done(null,x);
})






    }
  ));

};