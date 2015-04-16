'use strict';

var express = require('express');
var controller = require('../controller/incidente');
var config = require('../../config/environment');
var router = express.Router();
var multer  = require('multer');


router.get('/listarKU/:id', controller.incidentesKU);

router.get('/listarSinAsignar', controller.incidentesSinAsignar);
router.get('/listarConsultor/:id', controller.incidentesConsultor);
router.get('/estatusActual', controller.estatusActual);
router.get('/:id', controller.verIncidente);
router.post('/', controller.crear);
router.post('/tomarIncidente', controller.tomarIncidente);
router.post('/guardarIncidente', controller.guardarIncidente);
router.post('/entregarWorkArround', controller.entregarWorkArround);
router.post('/nuevoid', controller.nuevoid);
//DashBoard 
router.post('/dashboard/porcentajeCumplimiento',controller.porcentajeCumplimiento);
router.post('/dashboard/incidentesKeyUser',controller.incidentesPorKeyUser);
router.post('/dashboard/incidentesPorOrigenProblema',controller.incidentesPorOrigenProblema);
router.post('/dashboard/incidentesPorSistema',controller.incidentesPorSistema);
module.exports = router;
