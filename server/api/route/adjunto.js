'use strict';

var express = require('express');
var controller = require('../controller/adjunto');
var controllerProyecto = require('../controller/proyectoAdjunto');
var controllerEntregable = require('../controller/proyecto.entregableProyecto');
var config = require('../../config/environment');
var router = express.Router();
var multer  = require('multer');


router.post('/subirtemporal',[ multer({ dest: config.rutaAdjunto.url}), controller.subirtemporal]);
router.post('/subirEntregable',[ multer({ dest: config.rutaAdjunto.url}), controllerEntregable.actualizarEntregable]);

router.post('/subir',[ multer({ dest: config.rutaAdjunto.url}), controller.subir]);
router.get('/listar', controller.listar);
router.post('/listarAdjuntos', controller.listarAdjuntos);
router.post('/actualizaincidente', controller.actualizaincidente);
router.post('/listartemporales', controller.listartemporales);
router.get('/obtenerarchivo/:id', controller.obtenerarchivo);
router.post('/eliminararchivo/:id', controller.eliminararchivo);
/*
router.put('/:id', controller.update);
router.patch('/:id', controller.update);
router.delete('/:id', controller.destroy);*/


/* -- Adjuntos de Proyecto */

router.post('/proyecto',[ multer({ dest: config.rutaAdjunto.url}), controllerProyecto.subirtemporal]);
router.get('/proyecto/obtenerarchivo/:id', controllerProyecto.obtenerarchivo);

module.exports = router;
