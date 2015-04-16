'use strict';

var express = require('express');
var controller = require('../controller/administracion.codigoTermino');
var controllerOrigenProblema = require('../controller/administracion.origenProblema');
var controllertipoIncidente = require('../controller/administracion.tipoIncidente');
var config = require('../../config/environment');
//var auth = require('../../auth/auth.service');

var router = express.Router();

router.get('/listarCodigotermino', controller.listarCodigoTermino);
router.post('/codigoTermino/update', controller.updateCodigoTermino);
router.post('/codigoTermino/insert', controller.crear);
router.get('/origenProblema/listar', controllerOrigenProblema.listarOrigenProblema);
router.post('/origenProblema/update', controllerOrigenProblema.updateOrigenProblema);
router.post('/origenProblema/insert', controllerOrigenProblema.crear);

module.exports = router;