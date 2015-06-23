var models  = require('../model');
var express = require('express');
var elastic = require('elasticsearch');
var config = require('../../config/environment');


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

exports.buscaryCrear=  function(email,foto, callback){

    //Busca usuarios en Base Local

    //var email =req.params.id
    models.usuario.find({
        where: {
            email: email

        }

    }).then(function(usuario) {

        if (usuario==null){
            buscarExterno(email,function(x){
                crearUsuarioBase(x,callback(y))
                 })
        }
        else
        {

            if (foto!=usuario.foto)
                usuario.updateAttributes({
                    foto:foto
                }).success(function(x) {

                    usuario.foto =foto;

                })

            callback(usuario)

        }

    })


}

function buscarExterno(email,callback){
    var client = new elastic.Client({
        host: config.baseUsuarios.host

    });
var usuario={}
    client.get({
        index: config.baseUsuarios.index,
        type: config.baseUsuarios.type,
        id:email
    }).then(function (resp) {

        models.empresa.find({
            where: {
                rut: resp._source.rutEmpresa.trim()

            }

        }).then(function(empresa) {

            usuario.idEmpresa=empresa.idEmpresa;
            usuario.email=resp._source.email;
            usuario.nombre=resp._source.nombre;
            callback(usuario);
        })



    }, function (err) {
        console.trace(err.message);
    });



}

function crearUsuarioBase(user,callback){
var rolBase = JSON.stringify([20])

    models.usuario.create({

        nombre: user.nombre,
        email:  user.email,
        fechaCreacion:new Date(),
        fechaActualizacion: new Date(),
        fechaUltLogin:   null,
        rolesMenu:  rolBase,
        estado:1,
        home:'app.default',
        idEmpresa:user.idEmpresa

    }).success(function(usuario) {

callback(usuario);

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

models.empresa.find({where:{rut:req.body.usuario.rutEmpresa}}).success(function(empresa){
 
 
   models.usuario.create({

   nombre: req.body.usuario.nombre,
  email:  req.body.usuario.email,
  fechaCreacion:new Date(),
  fechaActualizacion: new Date(),
  fechaUltLogin:   new Date(),
  rolesMenu:  JSON.stringify(req.body.usuario.rolesMenu),
  estado:1,
  home:req.body.usuario.home,
  idEmpresa:empresa.idEmpresa

  }).success(function(usuario) {

   return res.json(200, usuario);

  }).error(function(usuario) {

   return res.json(401, usuario);

  });
 
 
} )



}


exports.update = function(req, res) {


models.usuario.find({where: {'usuarioId': req.body.usuario.usuarioId,'email': req.body.usuario.email}}).success(function (user) {

 user.rolesMenu =  JSON.stringify(req.body.usuario.rolesMenu);
user.fechaActualizacion =  new Date();
user.dashboard = req.body.usuario.home.nombre;
  user.save(['rolesMenu','fechaActualizacion','dashboard']).success(function(usuario) {

   return res.json(200, usuario);
})
});



}
