App.controller('incidente.tomarIncidente', ['$scope','Auth','$http','$stateParams','$state', function($scope,Auth,$http,$stateParams,$state) {
   
   
     $scope.incidente={};
    $scope.listas ={};
    $scope.getCurrentUser = Auth.getCurrentUser();
    
    //$routeParams.id
    $http.get('/api/incidente/'+ $stateParams.id).
      success(function(data) {
        $scope.incidente = data;
      });


  $scope.tomarIncidente = function(x) {
      if (confirm("¿Está seguro que desea tomar el incidente? " + x)){

        $scope.getCurrentUser = Auth.getCurrentUser();

        $scope.incidente.usuario= $scope.getCurrentUser.usuarioId;;

        $http.post('/api/incidente/tomarIncidente',$scope.incidente).
          success(function(data) {

//        $state.go('app.editarIncidenteConsultor',{id:$scope.idIncidente}, {notify:true});
        $state.go('app.editarIncidenteConsultor',{id:$scope.incidente.idIncidente}, {notify:true});

           

          });

      }

    }

}]);