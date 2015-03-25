'use strict';

var express = require('express');
var controller = require('../controller/usuario');
var config = require('../../config/environment');
var auth = require('../../auth/auth.service');

var router = express.Router();


router.post('/', controller.create);
router.post('/update', controller.update);
//router.get('/menu/:id', auth.isAuthenticated(),controller.getMenu);
router.get('/menu/:id',controller.getMenu);
router.get('/:id',controller.get);

module.exports = router;
