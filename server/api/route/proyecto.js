'use strict';

var express = require('express');
var controller = require('../controller/proyecto');
var controllerVersion = require('../controller/proyecto.version');

var config = require('../../config/environment');
//var auth = require('../../auth/auth.service');

var router = express.Router();

router.get('/prueba',controller.pruebaEmail);

router.post('/', controller.crearIniciativa);
router.get('/iniciativasPendientes/:id', controller.iniciativasPendientes);
router.get('/verIniciativa/:id', controller.verIniciativa);
router.post('/iniciativa', controller.crearPreEvaluacion);
router.post('/evaluacion', controller.crearEvaluacion);
router.post('/ejecucion', controller.crearEjecucion);

router.get('/:id', controller.index);
router.get('/verProyectoEmail/:id', controller.verProyectoEmail);
router.get('/jefeProyecto/:id', controller.porJefeProyecto);
router.get('/bp/:id', controller.porBp);
router.get('/dp/:id', controller.porDp);
router.get('/:id/versiones/', controllerVersion.getAll);
router.get('/version/:id',controllerVersion.get);
router.post('/enviarAprobacion', controller.enviarAprobacion);
router.post('/aprobarProyecto', controller.aprobarProyecto);
router.post('/actualizarAvance', controller.actualizarAvance);


module.exports = router;
