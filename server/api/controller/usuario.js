var models  = require('../model');
var express = require('express');



//Metodo standar para buscar usuario por Mail 
exports.get = function(req, res) {

  models.usuario.find({
      where: {
    email: req.params.id,

  }

  }).success(function(usuario) {

   return res.json(200, usuario);

  });
}

//Validar usuario autenticado
exports.buscarUsuarioEmail = function(profile,callback) {
  
  models.usuario.find({
      where: {
    email: profile.emails[0].value

  }

  }).success(function(usuario) {
 
 
 if (profile._json.picture!=usuario.foto)
  usuario.updateAttributes({
       foto:profile._json.picture
      }).success(function(x) {
         
     usuario.foto =profile._json.picture
          
      })
     
 callback(usuario)
  })
  
  
}


//Obtiene el Menu del usuario
exports.getMenu = function(req, res) {
 // console.log(models.usuario);
  models.usuario.find({
      where: {
    usuarioId: req.params.id,

  }

  }).success(function(usuario) {

   var roles = []
   var cabeceraMenu = []


     roles = JSON.parse(usuario.rolesMenu);
    
  models.Menu.findAll({attributes: ['menuId','Nombre', 'url','estilo','idPadre'] ,
  include: [{ model: models.rolMenus,where:{"rolId":roles}}]


  }).success(function(userMenu) {

 for (var i=0;i<=userMenu.length-1;i++)
 if (userMenu[i].idPadre ==0){
   var  menuJson = {}
 menuJson.menuId = userMenu[i].menuId;
 menuJson.Nombre =userMenu[i].Nombre;
 menuJson.url =userMenu[i].url;
 menuJson.estilo =userMenu[i].estilo
 menuJson.subMenu =[];
  cabeceraMenu.push(menuJson)

}

  for (var x=0;x<=cabeceraMenu.length-1;x++)
  {
    var aux = cabeceraMenu[x];
       aux.subMenu =[];

     for (var j=0;j<=userMenu.length-1;j++){


     if (userMenu[j].idPadre==cabeceraMenu[x].menuId)
     {

      aux.subMenu.push(userMenu[j]);
       cabeceraMenu[x]= aux;

     
     }

     }
  }

   
   return res.json(200, cabeceraMenu);

  });



  });
}

exports.create = function(req, res) {


  models.usuario.create({

   nombre: req.body.usuario.nombre,
  email:  req.body.usuario.email,
  fechaCreacion:new Date(),
  fechaActualizacion: new Date(),
  fechaUltLogin:   new Date(),
  rolesMenu:  JSON.stringify(req.body.usuario.rolesMenu),
  estado:1

  }).success(function(usuario) {

   return res.json(200, usuario);

  }).error(function(usuario) {

   return res.json(401, usuario);

  });

}


exports.update = function(req, res) {


models.usuario.find({where: {'usuarioId': req.body.usuario.usuarioId,'email': req.body.usuario.email}}).success(function (user) {

 user.rolesMenu =  JSON.stringify(req.body.usuario.rolesMenu);
user.fechaActualizacion =  new Date();

  user.save(['rolesMenu','fechaActualizacion']).success(function(usuario) {

   return res.json(200, usuario);
})
});



}
