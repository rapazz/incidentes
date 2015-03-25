App.controller('incidente.verIncidente', ['$scope','Auth','$http','$stateParams', function($scope,Auth,$http,$stateParams) {
   
     $scope.incidente={};
    $scope.listas ={};
    $scope.getCurrentUser = Auth.getCurrentUser();
    //$routeParams.id
    $http.get('/api/incidente/'+ $stateParams.id).
      success(function(data) {
        $scope.incidente = data;
      });


 
}]);