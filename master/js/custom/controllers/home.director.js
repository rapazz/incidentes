App.controller('home.director', ['$scope','Auth','$http','$state','$rootScope', function($scope,Auth,$http,$stateParams,$state,$rootScope) {
   
     $scope.incidente={};
    $scope.listas ={};

    $scope.getCurrentUser = Auth.getCurrentUser();
    //$routeParams.id
    $http.get('/api/proyecto/dp/26').
      success(function(data) {
console.log(data)
        $scope.proyectos = data;





        });


$scope.cargarHome= function () {
    $state.go($rootScope.user.dashboard,null, {notify:true});
}



}]);