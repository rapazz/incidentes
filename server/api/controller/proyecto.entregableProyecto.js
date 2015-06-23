var models  = require('../model');
var express = require('express');
var _ = require('lodash');
var config = require('../../config/environment');



// Get list of incidentes
exports.obtenerarchivo = function(req, res) {




    res.download(config.rutaAdjunto.url +'/'+ req.params.id) ;



};


exports.actualizarEntregable = function(req, res,next) {


    var archivo = req.files["file"];

    models.entregableProyecto.find({where:{idEntregable:req.body.idEntregable,idProyecto: req.body.idProyecto}}).success(function(x){


        x.estado =1;
        x.fechaActualizacion = new Date();
        x.fechaEntrega = new Date();
        x.nombreAdjunto = archivo.originalname;
        x.urlArchivo =archivo.name
        x.save()

         return res.json(200, x);
    })




};


