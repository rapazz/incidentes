App.controller('proyecto.verProyecto', ['$scope','Auth','$http','$stateParams','$state','$rootScope', function($scope,Auth,$http,$stateParams,$state,$rootScope) {
   
     $scope.incidente={};
    $scope.listas ={};

    $scope.getCurrentUser = Auth.getCurrentUser();
    //$routeParams.id
    $http.get('/api/proyecto/'+ $stateParams.id).
      success(function(data) {
console.log(data)
        $scope.proyecto = data;





        });


$scope.cargarHome= function () {
    $state.go($rootScope.user.dashboard,null, {notify:true});
}



}]);