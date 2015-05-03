App.controller('administracion.tipoIncidente', ['$scope','Auth','$http','toaster', function($scope,Auth,$http,toaster) {
$scope.tipoIncidente = {}
$scope.listas ={}
$scope.listas.estado=[];
$scope.habilitarGrabar = -1 
$scope.listas.estado.push({id:1,nombre:'Activo'});
$scope.listas.estado.push({id:0,nombre:'Inactivo'});
 $http.get('/api/administracion/tipoIncidente/listar').
        success(function(data) {
          $scope.data = data;
 });    
  
  
$scope.seleccionar = function(item){
$scope.tipoIncidente.id= item.TipoIncidenteId;
$scope.tipoIncidente.estado = item.EsActivo;
$scope.tipoIncidente.nombre =item.Nombre
$scope.tipoIncidente.sla =item.sla
$scope.habilitarGrabar = 0;
}
   
$scope.nuevoRegistro = function(){
    
$scope.tipoIncidente.id= 0;
$scope.tipoIncidente.estado =1;
$scope.tipoIncidente.nombre ='';

$scope.habilitarGrabar = 1;
    
}   
   
$scope.prueba = function(){
 toaster.pop('success','Registro Actualizado', 'Se actualiza correctamente el registro');
console.log(toaster)

}   
   
$scope.actualizarRegistro = function(){


	$http.post('/api/administracion/tipoIncidente/update', {tipoIncidente:$scope.tipoIncidente}).
  success(function(data, status, headers, config) {
  	
 
 toaster.pop('success','Registro Actualizado', 'Se actualiza correctamente el registro');
 
 
$scope.tipoIncidente.id= 0;
$scope.tipoIncidente.estado =1;
$scope.tipoIncidente.nombre ='';
$scope.tipoIncidente.sla ='';
$scope.habilitarGrabar = -1;
 $http.get('/api/administracion/tipoIncidente/listar').
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


	$http.post('/api/administracion/tipoIncidente/insert', {tipoIncidente:$scope.tipoIncidente}).
  success(function(data, status, headers, config) {
  	
 
 toaster.pop('success','Registro Creado', 'Se actualiza correctamente el registro');
 
$scope.tipoIncidente.id= 0;
$scope.tipoIncidente.estado =1;
$scope.tipoIncidente.nombre ='';

$scope.habilitarGrabar = -1;
 $http.get('/api/administracion/tipoIncidente/listar').
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