App.controller('proyecto.aprobarEmail', ['$scope','$http','$stateParams','$state','$rootScope', function($scope,$http,$stateParams,$state,$rootScope) {
   
     $scope.incidente={};
    $scope.listas ={};
$scope.permitirAprobacion = true;

    //$routeParams.id
    $http.get('/api/proyecto/verProyectoEmail/'+ $stateParams.id).
      success(function(data) {

        $scope.proyecto = data;
console.log(data)




        });




    $scope.aprobarProyecto=function(estado){

        console.log('qweqe')

        var x = {}

        x.id = $stateParams.id
        x.estado = estado


        $http.post('api/proyecto/aprobarProyecto', {aprobador:x}).
            success(function(data, status, headers, config) {

                $scope.guardadoCorrectamente =true;
                $scope.permitirAprobacion = false;

            }).
            error(function(data, status, headers, config) {
                // called asynchronously if an error occurs
                // or server returns response with an error status.

            });


    }


}]);