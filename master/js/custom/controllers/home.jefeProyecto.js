/**=========================================================
 * Module: flot-chart.js
 * Initializes the flot chart plugin and attaches the 
 * plugin to elements according to its type
 =========================================================*/

App.controller('home.jefeProyecto', ['$scope','$http','Auth','$filter','ngDialog','$state', function($scope, $http,Auth,$filter,ngDialog,$state) {
  'use strict';
$scope.dashboard ={}
$scope.miFiltro ={}
$scope.getCurrentUser = Auth.getCurrentUser();


 $scope.filtroAsignado = function(p) {
        return p.idUsuarioConsultor > -1;
      }


 $scope.filtroPreEvaluacion = function(p) {
        return ((p.idEtapaProyecto == 2))
      }

    $scope.filtroIniciativaAprobada = function(p) {
        return ((p.idEstadoProyecto == 2))
    }
    $scope.filtroEvaluacion = function(p) {
        return ((p.idEtapaProyecto == 3))
    }
    $scope.filtroEjecucion = function(p) {
        return ((p.idEtapaProyecto == 4))
    }


$scope.cargarFiltro =function (p) {
  switch(p) {
    case 1:
        $scope.miFiltro = $scope.filtroIniciativaAprobada
        break;
    case 2:
        $scope.miFiltro = $scope.filtroPreEvaluacion
        break;
  case 3:
       $scope.miFiltro = $scope.filtroEvaluacion
        break;
      case 4:
          $scope.miFiltro = $scope.filtroEjecucion
          break;
}

}


    $scope.generarPreEvaluacion= function(id){

        $scope.id = id;
        ngDialog.openConfirm({
            template: 'dialogVentanaPreAprobacion',
            className: 'ngdialog-theme-default',
            preCloseCallback: function(value) {

                var nestedConfirmDialog = ngDialog.openConfirm({
                    template:
                    '<p>Estas Seguro que quieres cerrar</p>' +
                    '<div>' +
                    '<button type="button" class="btn btn-default" ng-click="closeThisDialog(0)">No' +
                    '<button type="button" class="btn btn-primary" ng-click="confirm(1)">Yes' +
                    '</button></div>',
                    plain: true,
                    className: 'ngdialog-theme-default'
                }).then(function (value) {
                    $scope.cerrarPagina();
                });

                return nestedConfirmDialog;
            },
            scope: $scope
        })
            .then(function(value){
$scope.proyecto = {};
                $scope.proyecto.idUsuario = Auth.getCurrentUser().usuarioId;
                $scope.proyecto.estadoProyecto ={}
                $scope.proyecto.estadoProyecto.idEstadoProyecto=2;
                $scope.proyecto.idProyecto =id;



                $http.post('api/proyecto/iniciativa', {proyecto:$scope.proyecto}).
                    success(function(data, status, headers, config) {

                        $state.go('app.preEvaluacion',{id:id}, {notify:true});

                    }).
                    error(function(data, status, headers, config) {
                        // called asynchronously if an error occurs
                        // or server returns response with an error status.


                    });


                // Perform the save here
            }, function(value){
                $scope.cerrarPagina();

            });

    }



    $scope.generarEvaluacion= function(id,idEstado){
if (idEstado ==6)
{
    $scope.id = id;
    ngDialog.openConfirm({
        template: 'dialogVentanaEvaluacion',
        className: 'ngdialog-theme-default',
        preCloseCallback: function (value) {

            var nestedConfirmDialog = ngDialog.openConfirm({
                template: '<p>Estas Seguro que quieres cerrar</p>' +
                '<div>' +
                '<button type="button" class="btn btn-default" ng-click="closeThisDialog(0)">No' +
                '<button type="button" class="btn btn-primary" ng-click="confirm(1)">Yes' +
                '</button></div>',
                plain: true,
                className: 'ngdialog-theme-default'
            }).then(function (value) {
                $scope.cerrarPagina();
            });

            return nestedConfirmDialog;
        },
        scope: $scope
    })
        .then(function (value) {

            $scope.proyecto = {};
            $scope.proyecto.idUsuario = Auth.getCurrentUser().usuarioId;
            $scope.proyecto.estadoProyecto = {}
            $scope.proyecto.estadoProyecto.idEstadoProyecto = 6;
            $scope.proyecto.idProyecto = id;


            $http.post('api/proyecto/evaluacion', {proyecto: $scope.proyecto}).
                success(function (data, status, headers, config) {

                    $state.go('app.preEvaluacion', {id: id}, {notify: true});

                }).
                error(function (data, status, headers, config) {
                    // called asynchronously if an error occurs
                    // or server returns response with an error status.


                });


            // Perform the save here
        }, function (value) {
            $scope.cerrarPagina();

        });
}
else
    $state.go('app.preEvaluacion',{id:id}, {notify:true});
    }


    $scope.generarEjecucion= function(id,idEstado){
        if (idEstado ==12)
        {
            $scope.id = id;
            ngDialog.openConfirm({
                template: 'dialogVentanaEvaluacion',
                className: 'ngdialog-theme-default',
                preCloseCallback: function (value) {

                    var nestedConfirmDialog = ngDialog.openConfirm({
                        template: '<p>Estas Seguro que quieres cerrar</p>' +
                        '<div>' +
                        '<button type="button" class="btn btn-default" ng-click="closeThisDialog(0)">No' +
                        '<button type="button" class="btn btn-primary" ng-click="confirm(1)">Yes' +
                        '</button></div>',
                        plain: true,
                        className: 'ngdialog-theme-default'
                    }).then(function (value) {
                        $scope.cerrarPagina();
                    });

                    return nestedConfirmDialog;
                },
                scope: $scope
            })
                .then(function (value) {

                    $scope.proyecto = {};
                    $scope.proyecto.idUsuario = Auth.getCurrentUser().usuarioId;
                    $scope.proyecto.estadoProyecto = {}
                    $scope.proyecto.estadoProyecto.idEstadoProyecto = 12;
                    $scope.proyecto.idProyecto = id;


                    $http.post('api/proyecto/ejecucion', {proyecto: $scope.proyecto}).
                        success(function (data, status, headers, config) {

                            $state.go('app.avanzarProyecto', {id: id}, {notify: true});

                        }).
                        error(function (data, status, headers, config) {
                            // called asynchronously if an error occurs
                            // or server returns response with an error status.


                        });


                    // Perform the save here
                }, function (value) {
                    $scope.cerrarPagina();

                });
        }
        else
            $state.go('app.preEvaluacion',{id:id}, {notify:true});
    }

// + $scope.getCurrentUser.usuarioId
 $http.get('/api/proyecto/jefeProyecto/'+$scope.getCurrentUser.usuarioId).
        success(function(data) {
          $scope.data = data;
          $scope.dashboard.iniciativaAprobada = $filter("filter")( $scope.data, $scope.filtroIniciativaAprobada).length;
           $scope.dashboard.preEvaluacion = $filter("filter")( $scope.data, $scope.filtroPreEvaluacion).length;
         $scope.dashboard.evaluacion = $filter("filter")( $scope.data, $scope.filtroEvaluacion).length;
         $scope.dashboard.ejecucion = $filter("filter")( $scope.data, $scope.filtroEjecucion).length;
         $scope.dashboard.misCasos= data.length;
          
        });
        
}]);