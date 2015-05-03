'use strict';

var express = require('express');
var controller = require('../controller/administracion.codigoTermino');
var controllerOrigenProblema = require('../controller/administracion.origenProblema');
var controllertipoIncidente = require('../controller/administracion.tipoIncidente');
var controllerSubTipoIncidente  = require('../controller/administracion.subTipoIncidente');
var config = require('../../config/environment');
//var auth = require('../../auth/auth.service');

var router = express.Router();

router.get('/listarCodigotermino', controller.listarCodigoTermino);
router.post('/codigoTermino/update', controller.updateCodigoTermino);
router.post('/codigoTermino/insert', controller.crear);
router.get('/origenProblema/listar', controllerOrigenProblema.listarOrigenProblema);
router.post('/origenProblema/update', controllerOrigenProblema.updateOrigenProblema);
router.post('/origenProblema/insert', controllerOrigenProblema.crear);
router.get('/tipoIncidente/listar', controllertipoIncidente.listarTipoincidente);
router.post('/tipoIncidente/update', controllertipoIncidente.updateTipoIncidente);
router.post('/tipoIncidente/insert', controllertipoIncidente.crear);
router.get('/subTipoIncidente/listar', controllerSubTipoIncidente.listarSubTipoincidente);
router.post('/subTipoIncidente/update', controllerSubTipoIncidente.updateSubTipoIncidente);
router.post('/subTipoIncidente/insert', controllerSubTipoIncidente.crear);
module.exports = router;