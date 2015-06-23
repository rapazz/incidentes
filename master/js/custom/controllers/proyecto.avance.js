App.controller('proyecto.avance', ['$scope','Auth','$http','$stateParams','$state','$rootScope','FileUploader','ngDialog', function($scope,Auth,$http,$stateParams,$state,$rootScope,FileUploader,ngDialog) {
   
     $scope.incidente={};
    $scope.listas ={};

    var uploader = $scope.uploader = new FileUploader({
        url: '/api/adjunto/subirEntregable',
        autoUpload:true
    });
    $scope.getCurrentUser = Auth.getCurrentUser();
    //$routeParams.id
    $http.get('/api/proyecto/'+ $stateParams.id).
      success(function(data) {

        $scope.proyecto = data;





        });

    $http.get('/api/listas/parametros/6').success(function(saludProyecto) {
        $scope.listas.saludProyecto  = saludProyecto;
    });


$scope.cargarHome= function () {
    $state.go($rootScope.user.dashboard,null, {notify:true});
}





    uploader.onAfterAddingFile = function(fileItem) {
        console.info('onAfterAddingFile', fileItem);
        $scope.proyecto.entregableProyecto

        for(var item in $scope.proyecto.entregableProyecto)
        {
            if ($scope.proyecto.entregableProyecto[item].idTipoEntregable ==fileItem.id)
                $scope.proyecto.entregableProyecto[item].nombreAdjunto =fileItem.file.name


        }
    };

    uploader.onBeforeUploadItem = function(item) {

        var   formData = [{
            idProyecto:  $scope.proyecto.idProyecto,
            idEntregable : item.idEntregable

        }];
        console.log(item);

        Array.prototype.push.apply(item.formData, formData);
    };

    $scope.actualizarAvance =function(){

        $http.post('api/proyecto/actualizarAvance', {proyecto:$scope.proyecto}).
            success(function(data, status, headers, config) {

                $scope.openConfirmWithPreCloseCallbackInlinedWithNestedConfirm();
                //   $location.path('/proyecto/listar');

            }).
            error(function(data, status, headers, config) {
                // called asynchronously if an error occurs
                // or server returns response with an error status.

            });

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

}]);