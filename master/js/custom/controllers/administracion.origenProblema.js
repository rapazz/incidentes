App.controller('administracion.origenProblema', ['$scope','Auth','$http','toaster', function($scope,Auth,$http,toaster) {
$scope.origenProblema = {}
$scope.listas ={}
$scope.listas.estado=[];
$scope.habilitarGrabar = -1 
$scope.listas.estado.push({id:1,nombre:'Activo'});
$scope.listas.estado.push({id:0,nombre:'Inactivo'});
 $http.get('/api/administracion/origenProblema/listar').
        success(function(data) {
          $scope.data = data;
 });    
  
  
$scope.seleccionar = function(item){
$scope.origenProblema.id= item.OrigenProblemaId;
$scope.origenProblema.estado = item.EsActivo;
$scope.origenProblema.nombre =item.Nombre
$scope.habilitarGrabar = 0;
}
   
$scope.nuevoRegistro = function(){
    
$scope.origenProblema.id= 0;
$scope.origenProblema.estado =1;
$scope.origenProblema.nombre ='';

$scope.habilitarGrabar = 1;
    
}   
   
$scope.prueba = function(){
 toaster.pop('success','Registro Actualizado', 'Se actualiza correctamente el registro');
console.log(toaster)

}   
   
$scope.actualizarRegistro = function(){


	$http.post('/api/administracion/origenProblema/update', {origenProblema:$scope.origenProblema}).
  success(function(data, status, headers, config) {
  	
 
 toaster.pop('success','Registro Actualizado', 'Se actualiza correctamente el registro');
 
 
$scope.origenProblema.id= 0;
$scope.origenProblema.estado =1;
$scope.origenProblema.nombre ='';

$scope.habilitarGrabar = -1;
 $http.get('/api/administracion/origenProblema/listar').
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


	$http.post('/api/administracion/origenProblema/insert', {origenProblema:$scope.origenProblema}).
  success(function(data, status, headers, config) {
  	
 
 toaster.pop('success','Registro Creado', 'Se actualiza correctamente el registro');
 
$scope.origenProblema.id= 0;
$scope.origenProblema.estado =1;
$scope.origenProblema.nombre ='';

$scope.habilitarGrabar = -1;
 $http.get('/api/administracion/origenProblema/listar').
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