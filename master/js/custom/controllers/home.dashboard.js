/**=========================================================
 * Module: flot-chart.js
 * Initializes the flot chart plugin and attaches the 
 * plugin to elements according to its type
 =========================================================*/

App.controller('home.dashboard', ['$scope','$http','Auth','$state','$rootScope', function($scope, $http,Auth,$state,$rootScope) {
  'use strict';

    $state.go($rootScope.user.dashboard,null, {notify:true});

        
}]);