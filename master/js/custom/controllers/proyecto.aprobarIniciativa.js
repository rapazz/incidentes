App.controller('proyecto.aprobarIniciativa', ['$scope','Auth','$http','$stateParams','$state','$rootScope', function($scope,Auth,$http,$stateParams,$state,$rootScope) {
   
     $scope.incidente={};
    $scope.listas ={};
    $scope.getCurrentUser = Auth.getCurrentUser();
    //$routeParams.id
    $http.get('/api/proyecto/verIniciativa/'+ $stateParams.id).
      success(function(data) {

        $scope.proyecto = data;

            $http.get('/api/listas/estadoProyecto/'+data.etapa.idEtapaProyecto).success(function(estadoProyecto) {

                $scope.listas.estadoProyecto  = estadoProyecto;
                // $scope.proyecto.estadoProyecto  = data.estadoProyecto;
            });



            $http.get('/api/listas/jefeProyecto/'+ $scope.getCurrentUser.usuarioId).success(function(jefeProyecto) {

                $scope.listas.jefeProyecto  = jefeProyecto;
                //$scope.proyecto.jefeProyecto = proyecto.jefeProyecto




            });



        });

    $scope.actualizar = function () {


        $scope.proyecto.idUsuario = Auth.getCurrentUser().usuarioId;




        $http.post('api/proyecto/iniciativa', {proyecto:$scope.proyecto}).
            success(function(data, status, headers, config) {

                $state.go($rootScope.user.dashboard,null, {notify:true});

            }).
            error(function(data, status, headers, config) {
                // called asynchronously if an error occurs
                // or server returns response with an error status.


            });


    }




}]);