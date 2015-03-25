/** manejo de Autenficacion de usuario 
*/
  'use strict';
App.factory('Auth', function($location, $rootScope, $http,  $cookieStore, $q) {


 var currentUser = {};
    if($cookieStore.get('token')) {
     
      currentUser =$cookieStore.get('user');
    }
    
    return {
         logout: function() {
        $cookieStore.remove('token');
         $cookieStore.remove('user');
      },
      getCurrentUser: function() {
        return currentUser;
      },
      isLoggin: function(callback){
          if(!$cookieStore.get('token'))
          return false 
          else 
          return true
          
          
      }
        
    }

    
})



 .factory('authInterceptor', function ($rootScope, $q, $cookieStore, $location) {
    return {
              // Add authorization token to headers
      request: function (config) {
        config.headers = config.headers || {};
        if ($cookieStore.get('token')) {
         //TODO se deshabilita mientras se realizan pruebas.
         config.headers.Authorization = 'Bearer ' + $cookieStore.get('token');
        }
        return config;
      },

      // Intercept 401s and redirect you to login
      responseError: function(response) {
        if(response.status === 401) {
          $location.path('/login');
          // remove any stale tokens
          $cookieStore.remove('token');
          $cookieStore.remove('user');
          return $q.reject(response);
        }
        else {
          return $q.reject(response);
        }
      }
    };
  })