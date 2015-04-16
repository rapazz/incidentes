var models  = require('../model');
var express = require('express');



//listas Departamentos por Empresa
exports.listarOrigenProblema = function(req, res) {
  models.origenproblema.findAll({
  }).success(function(origenproblema) {

   return   res.status(200).json(origenproblema);
   
   
  });
}


exports.updateOrigenProblema = function(req, res) {


models.origenproblema.find({where: {'OrigenProblemaId': req.body.origenProblema.id}}).success(
    function (origenProblema) {

 origenProblema.Nombre =  req.body.origenProblema.nombre;
origenProblema.EsActivo =  req.body.origenProblema.estado;

  origenProblema.save(['Nombre','EsActivo']).success(function(x) {

   return res.status(200).json(x);
})
});



}


exports.crear = function(req, res) {


  models.origenproblema.create({
 Nombre:req.body.origenProblema.nombre,
 FechaCreacion:Date.now(),
 EsActivo:1

  }).success(function(x) {

 return res.status(200).json(x);
  });









  
};