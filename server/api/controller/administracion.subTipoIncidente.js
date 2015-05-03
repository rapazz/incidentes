var models  = require('../model');
var express = require('express');



//listas Departamentos por Empresa
exports.listarSubTipoincidente = function(req, res) {
  models.subtipoincidente.findAll({
  include :[{model:models.tipoincidente,as:'tipoincidente'}]}).success(function(SubTipoincidente) {

   return   res.status(200).json(SubTipoincidente);
   
   
  });
}


exports.updateSubTipoIncidente = function(req, res) {


models.subtipoincidente.find({where: {'SubTipoincidenteId': req.body.subTipoIncidente.id}}).success(
    function (SubTipoincidente) {

 SubTipoincidente.Nombre =  req.body.subTipoIncidente.nombre;
SubTipoincidente.EsActivo =  req.body.subTipoIncidente.estado;
SubTipoincidente.TipoIncidenteId =  req.body.subTipoIncidente.TipoIncidenteId;
  SubTipoincidente.save(['Nombre','EsActivo','TipoIncidenteId']).success(function(x) {

   return res.status(200).json(x);
})
});



}


exports.crear = function(req, res) {


  models.subtipoincidente.create({
 Nombre:req.body.subTipoIncidente.nombre,
 FechaCreacion:Date.now(),
 EsActivo:1,
 TipoIncidenteId:req.body.subTipoIncidente.TipoIncidenteId

  }).success(function(x) {

 return res.status(200).json(x);
  });









  
};