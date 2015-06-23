/**
 * Created by mbravo on 06-05-15.
 */
App.controller('proyecto.preEvaluacion', ['$scope','Auth','$http','FileUploader','ngDialog','$state','$rootScope','$stateParams', function($scope,Auth,$http,FileUploader,ngDialog,$state,$rootScope,$stateParams) {

    $scope.getCurrentUser = Auth.getCurrentUser();
    var uploader = $scope.uploader = new FileUploader({
        url: '/api/adjunto/proyecto'
    });



$scope.listas ={}
$scope.proyecto = {}

    $http.get('/api/listas/parametros/1').success(function(listadoComplejidad) {
        $scope.listas.complejidad  = listadoComplejidad;
    });
    $http.get('/api/listas/parametros/2').success(function(listadoRol) {
        $scope.listas.rolEquipo  = listadoRol;
    });
    $http.get('/api/listas/parametros/3').success(function(tipoProyecto) {
        $scope.listas.tipoProyecto = tipoProyecto;
    });
    $http.get('/api/listas/parametros/4').success(function(tipoAnexo) {
        $scope.listas.tipoAnexos = tipoAnexo;
    });
    $http.get('/api/listas/parametros/5').success(function(listadoEntregable) {
        $scope.listas.tipoEntregable  = listadoEntregable;
    });

    $scope.cerrarPagina = function (){

        $state.go($rootScope.user.dashboard,null, {notify:true});
    }


    $scope.agregarEquipo = function (){
        var jsonEquipo = {}

        if ($scope.idEmail == undefined || $scope.rolEquipo == undefined)
            $scope.equipoValido=false;
        else
        {

            jsonEquipo.email =$scope.idEmail[0]
            jsonEquipo.nombre = $scope.nombreEquipo[0];
            jsonEquipo.hh = $scope.hh;
            jsonEquipo.cargo={};
            jsonEquipo.cargo = $scope.rolEquipo

            console.log(jsonEquipo)
            $scope.arrEquipo.push(jsonEquipo)
            $scope.nombreEquipo="";
            $scope.idEmail = undefined;
            $scope.rolEquipo =undefined;
            $scope.equipoValido =true;
            $scope.hh = undefined;

        }

    }

    $scope.quitarEquipo =function (email){
        for (var i=0; i<= $scope.arrEquipo.length -1;i++)
            if  ($scope.arrEquipo[i].email==email)
                $scope.arrEquipo.splice(i,1)


    }


    //Carga de listas dinamicas.


    $http.get('/api/listas/empresa/').success(function(listasistema) {
        $scope.listas.empresa  = listasistema;

    });

    //Carga Proyecto
    $http.get('/api/proyecto/'+$stateParams.id).success(function(proyecto) {
        $scope.proyecto  = proyecto;

        $scope.proyecto.fechaEstimadaComienzo = new Date(proyecto.fechaEstimadaComienzo);
    $scope.arrEquipo = proyecto.equipoProyecto;
console.log(proyecto)
       // $scope.proyecto.fechaEstimadaComienzo = $filter("date")(Date.now(), 'yyyy-MM-dd');
        $scope.arrAdjuntos= proyecto.adjunto
        $scope.arrEntregable= proyecto.entregableProyecto



    });


//
    $scope.cargaModulo= function(){

        $http.get('/api/listas/departamento/' +$scope.proyecto.idEmpresa).success(function(listadoModulos) {
            $scope.listas.departamento  = listadoModulos;
        });

    }


    $scope.enviarAprobacionProyecto = function(){


          $scope.paginaValida=true;
        if ($scope.paginaValida)
        {
            $scope.proyecto.equipoProyecto = $scope.arrEquipo;
            $scope.proyecto.entregableProyecto = $scope.arrEntregable;
            $scope.proyecto.descripcionHistorial ="Enviar a Aprobar el Documento"
            $scope.proyecto.usuarioLogin = Auth.getCurrentUser().usuarioId

            console.log($scope.proyecto)

            $http.post('api/proyecto/enviarAprobacion', {proyecto:$scope.proyecto}).
                success(function(data, status, headers, config) {

                    $scope.openConfirmWithPreCloseCallbackInlinedWithNestedConfirm();
                //   $location.path('/proyecto/listar');

                }).
                error(function(data, status, headers, config) {
                    // called asynchronously if an error occurs
                    // or server returns response with an error status.

                });

        }

    }

    $scope.cerrarPagina = function (){

        $state.go($rootScope.user.dashboard,null, {notify:true});
    }


    $scope.openConfirmWithPreCloseCallbackInlinedWithNestedConfirm = function () {
        ngDialog.openConfirm({
            template: 'dialogWithNestedConfirmDialogId',
            className: 'ngdialog-theme-default',
            preCloseCallback: function(value) {

                var nestedConfirmDialog = ngDialog.openConfirm({
                    template:
                    '<p>Are you sure you want to close the parent dialog?</p>' +
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
                $scope.cerrarPagina();
                // Perform the save here
            }, function(value){
                $scope.cerrarPagina();

            });
    };

   //Metodos para subir Archivos.


    $scope.quitarEquipo =function (email){
        for (var i=0; i<= $scope.arrEquipo.length -1;i++)
            if  ($scope.arrEquipo[i].email==email)
                $scope.arrEquipo.splice(i,1)

    }

    $scope.agregarEntregable = function (){


        var jsonEntregable = {}

        if ($scope.semanaEntrega == undefined || $scope.tipoEntregable == undefined)
            $scope.entregableValido=false;
        else
        {


            jsonEntregable.tipoEntregable =$scope.tipoEntregable;
            jsonEntregable.semanaEntrega = $scope.semanaEntrega;
            jsonEntregable.estado = 0;



            var fechaEstimada = new Date( $scope.proyecto.fechaEstimadaComienzo);
            fechaEstimada.setDate(fechaEstimada.getDate() + parseInt($scope.semanaEntrega)*7)

            jsonEntregable.fechaEstimada =fechaEstimada
            $scope.arrEntregable.push(jsonEntregable)
            $scope.semanaEntrega="";
            $scope.tipoEntregable =undefined;
            $scope.entregableValido =true;

        }

    }

    $scope.quitarEntregable =function (tipoEntregable){
        for (var i=0; i<= $scope.arrEntregable.length -1;i++)
            if  ($scope.arrEntregable[i].tipoEntregable.id==tipoEntregable)
                $scope.arrEntregable.splice(i,1)


    }


    uploader.onAfterAddingAll = function(addedFileItems) {
        console.info('onAfterAddingAll', addedFileItems);
    };
    uploader.onProgressAll = function(progress) {
        console.info('onProgressAll', progress);
    };

    uploader.onBeforeUploadItem = function(item) {

        var   formData = [{
            idProyecto:  $scope.proyecto.idProyecto,
            idTipoAnexo: item.tipoAnexo.id

        }];
        console.log(item);

        Array.prototype.push.apply(item.formData, formData);
    };

    uploader.onCompleteItem=function(item, response, status, headers)
    {
      $scope.arrAdjuntos=response;
        item.remove();
    };

}])
