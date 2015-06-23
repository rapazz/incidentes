App.controller('proyecto.versiones', ['$scope','Auth','$http','$stateParams','$state','$rootScope', function($scope,Auth,$http,$stateParams,$state,$rootScope) {

    $scope.listas ={};
$scope.mostrar= false;
    $scope.getCurrentUser = Auth.getCurrentUser();
    //$routeParams.id
    $http.get('/api/proyecto/'+ $stateParams.id + '/versiones').
      success(function(data) {

        $scope.versiones = data;



        });


$scope.cargarVersion=function(idVersion){


    $http.get('/api/proyecto/version/'+ idVersion).
        success(function(data) {
$scope.mostrar = true;
            $scope.proyecto = data;
            console.log($scope.proyecto)





        });

}

$scope.cargarHome= function () {
    $state.go($rootScope.user.dashboard,null, {notify:true});
}



}]);