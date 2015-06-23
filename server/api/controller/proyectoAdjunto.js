var models  = require('../model');
var express = require('express');
var _ = require('lodash');
var config = require('../../config/environment');


// Get list of incidentes
exports.obtenerarchivo = function(req, res) {




    res.download(config.rutaAdjunto.url +'/'+ req.params.id) ;



};


exports.subirtemporal = function(req, res,next) {


    var archivo = req.files["file"];

    models.proyectoAdjunto.create({
        idProyecto: req.body.idProyecto,
        descripcion: archivo.originalname,
        guid: req.body.idProyecto,
        fechaCreacion: new Date(),
        urlArchivo: archivo.name,
        idTipoAdjunto: req.body.idTipoAnexo


    }).success(function(x) {


        models.proyectoAdjunto.findAll({where:{idProyecto:req.body.idProyecto}
            ,
            include:[{model:models.parametros,as:'tipoAdjunto'}]
        }).success(function(y){
            return res.json(200, y);

        })





    });

};