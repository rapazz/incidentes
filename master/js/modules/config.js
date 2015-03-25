/**=========================================================
 * Module: config.js
 * App routes and resources configuration
 =========================================================*/

App.config(['$stateProvider','$urlRouterProvider', '$controllerProvider', '$compileProvider', '$filterProvider', '$provide', '$ocLazyLoadProvider', 'APP_REQUIRES', 'RouteHelpersProvider','$httpProvider',
function ($stateProvider, $urlRouterProvider, $controllerProvider, $compileProvider, $filterProvider, $provide, $ocLazyLoadProvider, appRequires, helper,$httpProvider) {
  'use strict';
  
 //$httpProvider.interceptors.push('authInterceptor');


  App.controller = $controllerProvider.register;
  App.directive  = $compileProvider.directive;
  App.filter     = $filterProvider.register;
  App.factory    = $provide.factory;
  App.service    = $provide.service;
  App.constant   = $provide.constant;
  App.value      = $provide.value;

  // LAZY MODULES
  // ----------------------------------- 

  $ocLazyLoadProvider.config({
    debug: false,
    events: true,
    modules: appRequires.modules
  });


  // default route
//  $urlRouterProvider.otherwise('/login');

  // 
  // Application Routes
  // -----------------------------------   
  $stateProvider
     .state('app', {
        url: '/app',
        abstract: true,
        templateUrl: helper.basepath('app.html'),
        controller: 'AppController',
        resolve: helper.resolveFor('modernizr', 'icons','slimscroll')
    })
    .state('app.homeKu', {
        url: '/home/keyUser',
        title: 'Dashboard',
         module: 'private',
        templateUrl: helper.basepath('home/keyUser.html'),
         controller: 'home.keyUser'
    })
     .state('app.homeConsultor', {
        url: '/home/consultor',
        title: 'Dashboard',
         module: 'private',
        templateUrl: helper.basepath('home/consultor.html'),
         controller: 'home.consultor'
    })
    .state('app.singleview', {
        url: '/singleview',
        title: 'Single View',
         module: 'private',
        templateUrl: helper.basepath('singleview.html')
    })
    .state('app.submenu', {
        url: '/submenu', 
        title: 'Submenu',
        templateUrl: helper.basepath('submenu.html')
    })
      .state('app.crearIncidente', {
        url: '/incidentes/crearIncidente',
        templateUrl: helper.basepath('incidentes/crearIncidente.html'),
         module: 'private',
          controller: 'incidente.crearIncidente',
           resolve: helper.resolveFor('parsley','angularFileUpload','filestyle','ngDialog')
    })
     .state('app.editarIncidenteConsultor', {
        url: '/incidentes/editarConsultor/:id',
        templateUrl: helper.basepath('incidentes/editarConsultor.html'),
         module: 'private',
          controller: 'incidente.editarConsultor',
           resolve: helper.resolveFor('parsley','angularFileUpload','filestyle','ngDialog')
    })
    .state('app.responderKeyUser', {
        url: '/incidentes/responderKeyUser/:id',
        templateUrl: helper.basepath('incidentes/responderKeyUser.html'),
         module: 'private',
          controller: 'incidente.responderKeyUser',
           resolve: helper.resolveFor('parsley','angularFileUpload','filestyle','ngDialog')
    })
    .state('app.verIncidente', {
        url: '/incidentes/verIncidente/:id',
        templateUrl: helper.basepath('incidentes/ver.html'),
         module: 'private',
          controller: 'incidente.verIncidente',
           resolve: helper.resolveFor('slimscroll')
    })
    .state('app.tomarIncidente', {
        url: '/incidentes/tomarIncidente/:id',
        templateUrl: helper.basepath('incidentes/tomarIncidente.html'),
         module: 'private',
          controller: 'incidente.tomarIncidente',
    })
     .state('page', {
        url: '/page',
        templateUrl: 'app/pages/page.html',
         module: 'private',
        resolve: helper.resolveFor('modernizr', 'icons', 'parsley')
    })
    .state('login', {
        url: '/',
        title: "Login",
        module: 'public',
        templateUrl: 'app/pages/login.html'
    })
     .state('app.usuarios', {
        url: '/administracion/usuarios',
        title: "Administracion de usuarios",
        module: 'private',
        controller: 'administracion.usuarios',
        templateUrl: helper.basepath('Administracion/usuarios.html')
    })
    // 
    // CUSTOM RESOLVES
    //   Add your own resolves properties
    //   following this object extend
    //   method
    // ----------------------------------- 
    // .state('app.someroute', {
    //   url: '/some_url',
    //   templateUrl: 'path_to_template.html',
    //   controller: 'someController',
    //   resolve: angular.extend(
    //     helper.resolveFor(), {
    //     // YOUR RESOLVES GO HERE
    //     }
    //   )
    // })
    ;

}]).config(['$translateProvider', function ($translateProvider) {

    $translateProvider.useStaticFilesLoader({
        prefix : 'app/i18n/',
        suffix : '.json'
    });
    $translateProvider.preferredLanguage('en');
    $translateProvider.useLocalStorage();

}]).config(['cfpLoadingBarProvider', function(cfpLoadingBarProvider) {
    cfpLoadingBarProvider.includeBar = true;
    cfpLoadingBarProvider.includeSpinner = false;
    cfpLoadingBarProvider.latencyThreshold = 500;
    cfpLoadingBarProvider.parentSelector = '.wrapper > section';
  }])
.controller('NullController', function() {});
