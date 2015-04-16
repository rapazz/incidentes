var models  = require('../model');
var express = require('express');



//listas Departamentos por Empresa
exports.listarCodigoTermino = function(req, res) {
  models.codigotermino.findAll({
  }).success(function(codigoTermino) {

   return   res.status(200).json(codigoTermino);
   
   
  });
}


exports.updateCodigoTermino = function(req, res) {


models.codigotermino.find({where: {'CodigoTerminoId': req.body.codigoTermino.id}}).success(
    function (codigoTermino) {

 codigoTermino.Nombre =  req.body.codigoTermino.nombre;
codigoTermino.EsActivo =  req.body.codigoTermino.estado;

  codigoTermino.save(['Nombre','EsActivo']).success(function(x) {

   return res.status(200).json(x);
})
});



}


exports.crear = function(req, res) {


  models.codigotermino.create({
 Nombre:req.body.codigoTermino.nombre,
 FechaCreacion:Date.now(),
 EsActivo:1

  }).success(function(x) {

 return res.status(200).json(x);
  });









  
};