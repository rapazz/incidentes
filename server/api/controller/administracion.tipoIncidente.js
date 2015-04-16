var models  = require('../model');
var express = require('express');



//listas Departamentos por Empresa
exports.listarTipoincidente = function(req, res) {
  models.tipoincidente.findAll({
  }).success(function(tipoincidente) {

   return   res.status(200).json(tipoincidente);
   
   
  });
}


exports.updateTipoIncidente = function(req, res) {


models.tipoincidente.find({where: {'TipoIncidenteId': req.body.tipoIncidente.id}}).success(
    function (tipoIncidente) {

 tipoIncidente.Nombre =  req.body.tipoIncidente.nombre;
tipoIncidente.EsActivo =  req.body.tipoIncidente.estado;
tipoIncidente.sla =  req.body.tipoIncidente.sla;
  tipoIncidente.save(['Nombre','EsActivo','sla']).success(function(x) {

   return res.status(200).json(x);
})
});



}


exports.crear = function(req, res) {


  models.tipoincidente.create({
 Nombre:req.body.tipoIncidente.nombre,
 FechaCreacion:Date.now(),
 EsActivo:1,
 sla:req.body.tipoIncidente.sla

  }).success(function(x) {

 return res.status(200).json(x);
  });









  
};