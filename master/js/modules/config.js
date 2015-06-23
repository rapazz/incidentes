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
// $urlRouterProvider.otherwise('/');

    $urlRouterProvider.otherwise( function($injector, $location) {
        var $state = $injector.get("$state");
        $state.go("login");
    });



  // 
  // Application Routes
  // -----------------------------------   
  $stateProvider
     .state('app', {
        url: '/app',
        abstract: true,
        templateUrl: helper.basepath('app.html'),
        controller: 'AppController',
        resolve: helper.resolveFor('modernizr', 'icons','slimscroll','classyloader','toaster')
    })
    $stateProvider
        .state('ext', {
            url: '/ext',
            abstract: true,
            templateUrl: helper.basepath('ext.html'),
            controller: 'AppController',
            resolve: helper.resolveFor('modernizr', 'icons','slimscroll','classyloader','toaster')
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
    .state('app.homeSuperConsultor', {
        url: '/home/superConsultor',
        title: 'Dashboard',
        templateUrl: helper.basepath('home/superConsultor.html'),
        resolve: helper.resolveFor('chartjs','flot-chart','flot-chart-plugins'),
         controller: 'home.superConsultor'
    })
      .state('app.homeBp', {
          url: '/home/bp',
          title: 'Dashboard',
          module: 'private',
          templateUrl: helper.basepath('home/bp.html'),
          controller: 'home.bp'
      })
      .state('app.director', {
            url: '/home/director',
            title: 'Director',
            module: 'private',
            controller: 'home.director',
            templateUrl: helper.basepath('home/director.html'),
            resolve: helper.resolveFor('chartjs','flot-chart','flot-chart-plugins')
        })
      .state('app.homeJefeProyecto', {
          url: '/home/jefeProyecto',
          title: 'Dashboard',
          module: 'private',
          templateUrl: helper.basepath('home/jefeProyecto.html'),
          controller: 'home.jefeProyecto',
          resolve: helper.resolveFor('ngDialog')
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
     .state('app.codigoTermino', {
        url: '/administracion/codigoTermino',
        title: "Codigos de Termino",
        module: 'private',
        controller: 'administracion.codigoTermino',
        templateUrl: helper.basepath('Administracion/codigoTermino.html')
    })
    .state('app.origenProblema', {
        url: '/administracion/origenProblema',
        title: "origen Problema",
        module: 'private',
        controller: 'administracion.origenProblema',
        templateUrl: helper.basepath('Administracion/origenProblema.html')
    })
     .state('app.tipoIncidente', {
        url: '/administracion/tipoIncidente',
        title: "Tipo Sistema",
        module: 'private',
        controller: 'administracion.tipoIncidente',
        templateUrl: helper.basepath('Administracion/tipoIncidente.html')
    })
      .state('app.crearIniciativa', {
          url: '/proyecto/crearIniciativa',
          title: "crear Iniciativa",
          module: 'private',
          controller: 'proyecto.crearIniciativa',
          templateUrl: helper.basepath('proyecto/crearIniciativa.html'),
          resolve: helper.resolveFor('parsley','angularFileUpload','filestyle','ngDialog')
      })
      .state('app.aprobarIniciativa', {
          url: '/proyecto/aprobarIniciativa/:id',
          templateUrl: helper.basepath('proyecto/aprobarIniciativa.html'),
          module: 'private',
          controller: 'proyecto.aprobarIniciativa',
          resolve: helper.resolveFor('slimscroll')
      })
      .state('app.verIniciativa', {
          url: '/proyecto/verIniciativa/:id',
          templateUrl: helper.basepath('proyecto/verIniciativa.html'),
          module: 'private',
          controller: 'proyecto.verIniciativa',
          resolve: helper.resolveFor('slimscroll')
      })
      .state('app.preEvaluacion', {
          url: '/proyecto/preEvaluacion/:id',
          templateUrl: helper.basepath('proyecto/preEvaluacion.html'),
          module: 'private',
          controller: 'proyecto.preEvaluacion',
          resolve: helper.resolveFor('parsley','angularFileUpload','filestyle','ngDialog')
      })
       .state('app.avanzarProyecto', {
            url: '/proyecto/avance/:id',
            templateUrl: helper.basepath('proyecto/avance.html'),
            module: 'private',
            controller: 'proyecto.avance',
            resolve: helper.resolveFor('parsley','angularFileUpload','filestyle','ngDialog')
       })
      .state('app.verProyecto', {
          url: '/proyecto/verProyecto/:id',
          templateUrl: helper.basepath('proyecto/verProyecto.html'),
          module: 'private',
          controller: 'proyecto.verProyecto',
          resolve: helper.resolveFor('parsley','filestyle','ngDialog')
      })
      .state('app.versionesProyecto', {
          url: '/proyecto/versiones/:id',
          templateUrl: helper.basepath('proyecto/versiones.html'),
          module: 'private',
          controller: 'proyecto.versiones',
          resolve: helper.resolveFor('parsley','filestyle','ngDialog')

      })
        .state('app.dashboard', {
            url: '/home/dashboard',
            module: 'private',
            controller: 'home.dashboard'

        })
      .state('ext.aprobarProyecto', {
          url: '/proyecto/aprobacion/:id',
          templateUrl: helper.basepath('proyecto/verProyecto.html'),
          module: 'public',
          controller: 'proyecto.aprobarEmail',
          resolve: helper.resolveFor('parsley','filestyle','ngDialog')
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
