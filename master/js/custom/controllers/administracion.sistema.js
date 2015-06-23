App.controller('administracion.sistema', ['$scope','Auth','$http', function($scope,Auth,$http) {


    $http.get('/api/administracion/sistema').
        success(function(data) {
            $scope.data = data;
        });

}]);