/**
 * Created by mbravo on 06-05-15.
 */
App.controller('proyecto.crearIniciativa', ['$scope','Auth','$http','FileUploader','ngDialog','$state','$rootScope', function($scope,Auth,$http,FileUploader,ngDialog,$state,$rootScope) {

    $scope.getCurrentUser = Auth.getCurrentUser();
    var uploader = $scope.uploader = new FileUploader({
        url: '/api/adjunto/subir'
    });
$scope.listas ={}
$scope.proyecto = {}


    $scope.cerrarPagina = function (){

        $state.go($rootScope.user.dashboard,null, {notify:true});
    }


    //Carga de listas dinamicas.


    $http.get('/api/listas/empresa/').success(function(listasistema) {
        $scope.listas.empresa  = listasistema;

    });

    $scope.cargaModulo= function(){

        $http.get('/api/listas/departamento/' +$scope.proyecto.idEmpresa).success(function(listadoModulos) {
            $scope.listas.departamento  = listadoModulos;
        });

    }


 $scope.crearIniciativa  = function(){
     $scope.proyecto.usuario  = $scope.getCurrentUser

     $http.post('/api/proyecto/',{proyecto:$scope.proyecto}).
         success(function(data) {
             $scope.idProyecto=data.idProyecto;
             console.log(data)
             if (uploader.queue.length==0)
                 $scope.openConfirmWithPreCloseCallbackInlinedWithNestedConfirm()
             else
                 uploader.uploadAll()
         })

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

}])
