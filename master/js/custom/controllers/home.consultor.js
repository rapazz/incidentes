/**=========================================================
 * Module: flot-chart.js
 * Initializes the flot chart plugin and attaches the 
 * plugin to elements according to its type
 =========================================================*/

App.controller('home.consultor', ['$scope','$http','Auth','$filter', function($scope, $http,Auth,$filter) {
  'use strict';
$scope.dashboard ={}
$scope.miFiltro ={}
$scope.getCurrentUser = Auth.getCurrentUser();




 $scope.filtroAsignado = function(p) {
        return p.idUsuarioConsultor ==  $scope.getCurrentUser.usuarioId;
      }

 $scope.filtroSinAsignar = function(p) {
        return p.idUsuarioConsultor ==  -1;
      }

 $scope.filtroDevolucion = function(p) {
        return p.idEstado ==  70;
      }

 $scope.filtroPendiente = function(p) {
        return ((p.idEstado == 30 || p.idEstado ==60))  
      }

 $scope.filtroFueraSLA = function(p) {
        return (p.tiempoTranscurrido > p.sla)  
      }

$scope.cargarFiltro =function (p) {
  switch(p) {
    case 1:
       $scope.miFiltro =$scope.filtroAsignado
        break;
    case 2:
        $scope.miFiltro = $scope.filtroSinAsignar
        break;
  case 3:
       $scope.miFiltro = $scope.filtroDevolucion
        break;
   case 4:
       $scope.miFiltro = $scope.filtroFueraSLA
        break;
   default:
     $scope.miFiltro = $scope.filtroAsignado
     break;
}

}

 $scope.cargarFiltro(1);


 $http.get('/api/incidente/listarConsultor/' + $scope.getCurrentUser.usuarioId).
        success(function(data) {
          $scope.data = data;
          
          $scope.dashboard.misCasos = $filter("filter")( $scope.data, $scope.filtroAsignado).length;
           $scope.dashboard.sinAsignar = $filter("filter")( $scope.data, $scope.filtroSinAsignar).length;
           $scope.dashboard.devolucion = $filter("filter")( $scope.data, $scope.filtroDevolucion).length;
           $scope.dashboard.fueraSLA = $filter("filter")( $scope.data, $scope.filtroFueraSLA).length;
          
          
        });
        
}]);