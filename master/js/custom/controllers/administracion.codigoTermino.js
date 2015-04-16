App.controller('administracion.codigoTermino', ['$scope','Auth','$http','toaster', function($scope,Auth,$http,toaster) {
$scope.codigoTermino = {}
$scope.listas ={}
$scope.listas.estado=[];
$scope.habilitarGrabar = -1 
$scope.listas.estado.push({id:1,nombre:'Activo'});
$scope.listas.estado.push({id:0,nombre:'Inactivo'});
 $http.get('/api/administracion/listarCodigotermino').
        success(function(data) {
          $scope.data = data;
 });    
  
  
$scope.seleccionar = function(item){
$scope.codigoTermino.id= item.CodigoTerminoId;
$scope.codigoTermino.estado = item.EsActivo;
$scope.codigoTermino.nombre =item.Nombre
$scope.habilitarGrabar = 0;
}
   
$scope.nuevoRegistro = function(){
    
$scope.codigoTermino.id= 0;
$scope.codigoTermino.estado =1;
$scope.codigoTermino.nombre ='';

$scope.habilitarGrabar = 1;
    
}   
   
$scope.prueba = function(){
 toaster.pop('success','Registro Actualizado', 'Se actualiza correctamente el registro');
console.log(toaster)

}   
   
$scope.actualizarRegistro = function(){


	$http.post('/api/administracion/codigoTermino/update', {codigoTermino:$scope.codigoTermino}).
  success(function(data, status, headers, config) {
  	
 
 toaster.pop('success','Registro Actualizado', 'Se actualiza correctamente el registro');
 
 
$scope.codigoTermino.id= 0;
$scope.codigoTermino.estado =1;
$scope.codigoTermino.nombre ='';

$scope.habilitarGrabar = -1;
 $http.get('/api/administracion/listarCodigotermino').
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


	$http.post('/api/administracion/codigoTermino/insert', {codigoTermino:$scope.codigoTermino}).
  success(function(data, status, headers, config) {
  	
 
 toaster.pop('success','Registro Creado', 'Se actualiza correctamente el registro');
 
$scope.codigoTermino.id= 0;
$scope.codigoTermino.estado =1;
$scope.codigoTermino.nombre ='';

$scope.habilitarGrabar = -1;
 $http.get('/api/administracion/listarCodigotermino').
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