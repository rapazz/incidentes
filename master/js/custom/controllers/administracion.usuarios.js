App.controller('administracion.usuarios', ['$scope','Auth','elasticFactory','$http', function($scope,Auth,elasticFactory,$http) {

	$scope.idEmail ='';
	$scope.nombre="";
$scope.mensajeExito = false;
	$scope.usuarioId =0;
	$scope.activarBoton =false;
	$scope.arrayRoles={};

$http.get('/api/listas/listarRoles').success(function(roles) {
		
      $scope.roles = roles;
    });


$scope.seleccionarUsuario = function (){

	elasticFactory.get({
  index: 'contactos',
  type: 'kcc',
  id: $scope.idEmail[0]
}, function (error, response) {
	
$scope.activarBoton =true;
$scope.arrayRoles={};
$scope.nombre = response._source.nombre;
$scope.email = response._source.email;
$scope.rut =response._source.rut,
$scope.cargo =response._source.cargo;
$scope.empresa =response._source.empresa;


  	$http.get('/api/usuario/'+ response._source.email).success(function(roles) {
  	  if (roles !=undefined){
  	  $scope.usuarioId =roles.usuarioId;
		var a = JSON.parse(roles.rolesMenu)
     for (var i=0;i<= a.length -1;i++)
     	     	$scope.arrayRoles[a[i]]=true;
  	  }
     
    });
  
  
  
});
	
	
}

$scope.actualizarUsuario= function (){
	
	var usuario = {}
	console.log('aca si ')
	usuario.nombre =$scope.nombre;
	usuario.email =$scope.email;
	
	usuario.usuarioId =$scope.usuarioId;
  usuario.fechaCreacion= new Date();
  usuario.fechaActualizacion =new Date();
  usuario.fechaUltLogin= new Date();
  usuario.rolesMenu=cargaRoles();
  usuario.estado=1;
	
	if ($scope.usuarioId >0)
	$http.post('/api/usuario/update', {usuario:usuario}).
  success(function(data, status, headers, config) {
  	
$scope.mensajeExito = true; 
    // this callback will be called asynchronously
    // when the response is available
  }).
  error(function(data, status, headers, config) {
    // called asynchronously if an error occurs
    // or server returns response with an error status.
  });
	else 
	$http.post('/api/usuario', {usuario:usuario}).
  success(function(data, status, headers, config) {
  	
  
  }).
  error(function(data, status, headers, config) {
   
  });

	
}



function cargaRoles(){
  var arrRoles =[]
  
  for (var i=0;i<=$scope.roles.length -1;i++)
    if ($scope.arrayRoles[$scope.roles[i].rolId]==true)
      arrRoles.push($scope.roles[i].rolId)
      
      return arrRoles;
}

}]);