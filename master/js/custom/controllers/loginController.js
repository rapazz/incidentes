App.controller('loginController', ['$scope', '$state', '$window','Auth', function($scope, $state, $window,Auth) {

  
  $scope.loginOauth = function(provider) {
      $window.location.href = '/auth/' + provider;
    
                
              
    
  };
 

}]);