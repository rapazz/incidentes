App.controller('administracion.subTipoIncidente', ['$scope','Auth','$http','toaster', function($scope,Auth,$http,toaster) {
$scope.subTipoIncidente = {}
$scope.listas ={}
$scope.listas.estado=[];
$scope.habilitarGrabar = -1 
$scope.listas.estado.push({id:1,nombre:'Activo'});
$scope.listas.estado.push({id:0,nombre:'Inactivo'});
 $http.get('/api/administracion/subTipoIncidente/listar').
        success(function(data) {
          $scope.data = data;
 });    
  
    
      $http.get('/api/listas/incidente/tipoInicidente').success(function(listasistema) {
      $scope.listas.sistema  = listasistema;
    });

  
$scope.seleccionar = function(item){
$scope.subTipoIncidente.id= item.SubTipoIncidenteId;
$scope.subTipoIncidente.estado = item.EsActivo;
$scope.subTipoIncidente.nombre =item.Nombre
$scope.subTipoIncidente.TipoIncidenteId =item.TipoIncidenteId
console.log(item.TipoIncidenteId)
$scope.habilitarGrabar = 0;
}
   
$scope.nuevoRegistro = function(){
    
$scope.subTipoIncidente.id= 0;
$scope.subTipoIncidente.estado =1;
$scope.subTipoIncidente.nombre ='';
$scope.subTipoIncidente.TipoIncidenteId =-1;

$scope.habilitarGrabar = 1;
    
}   
   
$scope.prueba = function(){
 toaster.pop('success','Registro Actualizado', 'Se actualiza correctamente el registro');
console.log(toaster)

}   
   
$scope.actualizarRegistro = function(){


	$http.post('/api/administracion/subTipoIncidente/update', {subTipoIncidente:$scope.subTipoIncidente}).
  success(function(data, status, headers, config) {
  	
 
 toaster.pop('success','Registro Actualizado', 'Se actualiza correctamente el registro');
 
 
$scope.subTipoIncidente.id= 0;
$scope.subTipoIncidente.estado =1;
$scope.subTipoIncidente.nombre ='';
$scope.subTipoIncidente.TipoIncidenteId ='';
$scope.habilitarGrabar = -1;
 $http.get('/api/administracion/subTipoIncidente/listar').
        success(function(data) {
          $scope.data = data;
 });    
  


  }).
  error(function(data, status, headers, config) {
    // called asynchronously if an error occurs
    // or server returns response with an error status.
  });




}



$scope.crearRegistro = function(){


	$http.post('/api/administracion/subTipoIncidente/insert', {subTipoIncidente:$scope.subTipoIncidente}).
  success(function(data, status, headers, config) {
  	
 
 toaster.pop('success','Registro Creado', 'Se actualiza correctamente el registro');
 
$scope.subTipoIncidente.id= 0;
$scope.subTipoIncidente.estado =1;
$scope.subTipoIncidente.nombre ='';
$scope.subTipoIncidente.TipoIncidenteId=-1

$scope.habilitarGrabar = -1;
 $http.get('/api/administracion/subTipoIncidente/listar').
        success(function(data) {
          $scope.data = data;
 });    
  


  }).
  error(function(data, status, headers, config) {
    // called asynchronously if an error occurs
    // or server returns response with an error status.
  });




}
    
}]);