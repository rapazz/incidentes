/**=========================================================
 * Module: flot-chart.js
 * Initializes the flot chart plugin and attaches the 
 * plugin to elements according to its type
 =========================================================*/

App.controller('home.keyUser', ['$scope','$http','Auth','$filter', function($scope, $http,Auth,$filter) {
  'use strict';
$scope.dashboard ={}
$scope.miFiltro ={}
$scope.getCurrentUser = Auth.getCurrentUser();


 $scope.filtroAsignado = function(p) {
        return p.idUsuarioConsultor > -1;
      }


 $scope.filtroPendiente = function(p) {
        return ((p.idEstado == 30 || p.idEstado ==60))  
      }


$scope.cargarFiltro =function (p) {
  switch(p) {
    case 1:
       $scope.miFiltro ={}
        break;
    case 2:
        $scope.miFiltro = $scope.filtroPendiente
        break;
  case 3:
       $scope.miFiltro = $scope.filtroAsignado
        break;
}

}

 

 $http.get('/api/incidente/listarKU/' + $scope.getCurrentUser.usuarioId).
        success(function(data) {
          $scope.data = data;
          
          $scope.dashboard.asignado = $filter("filter")( $scope.data, $scope.filtroAsignado).length;
           $scope.dashboard.pendiente = $filter("filter")( $scope.data, $scope.filtroPendiente).length;
          $scope.dashboard.misCasos= data.length;
          
        });
        
}]);