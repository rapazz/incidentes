/*!
 * 
 * Angle - Bootstrap Admin App + AngularJS
 * 
 * Author: @themicon_co
 * Website: http://themicon.co
 * License: http://support.wrapbootstrap.com/knowledge_base/topics/usage-licenses
 * 
 */

if (typeof $ === 'undefined') { throw new Error('This application\'s JavaScript requires jQuery'); }


// APP START
// ----------------------------------- 

var App = angular.module('angle', ['ngRoute', 'ngAnimate', 'ngStorage', 'ngCookies', 'pascalprecht.translate', 'ui.bootstrap', 'ui.router', 'oc.lazyLoad', 'cfp.loadingBar', 'ngSanitize', 'ngResource','elasticsearch','btford.socket-io','ui.utils'])
          .run(["$rootScope", "$state", "$stateParams",  '$window', '$templateCache','Auth','$location','mySocket', function ($rootScope, $state, $stateParams, $window, $templateCache,Auth,$location,mySocket) {
              // Set reference to access them from any scope
              $rootScope.$state = $state;
              $rootScope.$stateParams = $stateParams;
              $rootScope.$storage = $window.localStorage;

              // Uncomment this to disables template cache
              /*$rootScope.$on('$stateChangeStart', function(event, toState, toParams, fromState, fromParams) {
                  if (typeof(toState) !== 'undefined'){
                    $templateCache.remove(toState.templateUrl);
                  }
              });*/

              // Scope Globals
              // ----------------------------------- 
              $rootScope.app = {
                name: 'Incidentes',
                description: 'Sistema Gestion de Incidentes',
                year: ((new Date()).getFullYear()),
                layout: {
                  isFixed: true,
                  isCollapsed: false,
                  isBoxed: false,
                  isRTL: false
                },
                viewAnimation: 'ng-fadeInUp'
              };
         
      //Valida cada pagina   
        $rootScope.$on('$stateChangeStart', function(e, toState, toParams, fromState, fromParams) {
    if (toState.module==='public' && Auth.isLoggin() ) {
    
        // If logged out and transitioning to a logged in page: kljklj
        e.preventDefault();
        $state.go('app.homeConsultor',null, {notify:true});
    }
    
     if (toState.module==='private' && !Auth.isLoggin() ) {
    
        // If logged out and transitioning to a logged in page: kljklj
        e.preventDefault();
        $state.go('login',null, {notify:true});
    }
    
        });     
           
             
              if (Auth.isLoggin())  {
                
                 mySocket.emit('registarUsuario', Auth.getCurrentUser() );
//VALIDAR


                var user =Auth.getCurrentUser();
                  $rootScope.user = {
                  name:     user.nombre,
                  email:user.email,
                  usuarioId:user.usuarioId,
                  picture:  user.foto,
                  empresa:user.empresa
                  };
             var roles = JSON.parse(user.rolesMenu)
             if (roles.indexOf(80)>0)
                $state.go('app.homeSuperConsultor',null, {notify:true});
                else 
             if (roles.indexOf(40)>0)
                $state.go('app.homeKu',null, {notify:true});
             else 
                $state.go('app.homeConsultor',null, {notify:true});
              } 
              
            }
          ]);
