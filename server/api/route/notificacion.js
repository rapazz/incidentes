'use strict';

var express = require('express');
var controller = require('../controller/notificaciones');
var config = require('../../config/environment');

var router = express.Router();


router.get('/:id', controller.cargarNotificaciones);
router.post('/marcarLeida', controller.marcarLeida);
module.exports = router;