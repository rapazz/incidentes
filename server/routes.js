/**
 * Main application routes
 */

'use strict';

var errors = require('./components/errors');

module.exports = function(app) {

    //app.use('/api/proyecto', require('./api/route/proyecto'));

  app.use('/auth', require('./auth'));
  app.use('/api/usuario', require('./api/route/usuario'));
  app.use('/api/listas', require('./api/route/listas'));
  app.use('/api/incidente', require('./api/route/incidente'));
   app.use('/api/adjunto', require('./api/route/adjunto'));
  app.use('/api/administracion', require('./api/route/administracion'));
    app.use('/api/proyecto', require('./api/route/proyecto'));
    app.use('/api/notificaciones', require('./api/route/notificacion'));
  // All undefined asset or api routes should return a 404
  app.route('/:url(api|auth|components|app|bower_components|assets)/*')
   .get(errors[404]);

  // All other routes should redirect to the index.html
  app.route('/*')
    .get(function(req, res) {
      res.sendfile(app.get('appPath') + '/index.html');
    });
};
