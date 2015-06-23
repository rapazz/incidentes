/**=========================================================
 * Module: flot-chart.js
 * Initializes the flot chart plugin and attaches the 
 * plugin to elements according to its type
 =========================================================*/

App.controller('home.bp', ['$scope','$http','Auth','$filter', function($scope, $http,Auth,$filter) {
  'use strict';
$scope.dashboard ={}
$scope.miFiltro ={}
$scope.getCurrentUser = Auth.getCurrentUser();


 $scope.filtroIniciativa = function(p) {
        return p.idEtapaProyecto == 1;
      }


 $scope.filtroEvaluacion = function(p) {
        return ((p.idEtapaProyecto == 2 || p.idEtapaProyecto ==3))
      }

    $scope.filtroEjecucion= function(p) {
        return ((p.idEtapaProyecto ==4))
    }



    $scope.cargarFiltro =function (p) {
  switch(p) {
    case 1:
       $scope.miFiltro =$scope.filtroIniciativa
        break;
    case 2:
        $scope.miFiltro = $scope.filtroEvaluacion
        break;
  case 3:
       $scope.miFiltro = $scope.filtroEjecucion
        break;
}

}

 


    $http.get('/api/proyecto/bp/'+$scope.getCurrentUser.usuarioId).
        success(function(data) {
            $scope.data = data;
            $scope.dashboard.iniciativa = $filter("filter")( $scope.data, $scope.filtroIniciativa).length;
            $scope.dashboard.evaluacion = $filter("filter")( $scope.data, $scope.filtroEvaluacion).length;
            $scope.dashboard.ejecucion = $filter("filter")( $scope.data, $scope.filtroEjecucion).length;
            $scope.dashboard.misCasos= data.length;

        });

}]);