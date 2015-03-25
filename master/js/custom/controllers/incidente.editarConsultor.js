App.controller('incidente.editarConsultor', ['$scope','Auth','$http','$stateParams','FileUploader','ngDialog','$state', function($scope,Auth,$http,$stateParams,FileUploader,ngDialog,$state) {
   
     $scope.incidente={};
    $scope.listas ={};
    $scope.getCurrentUser = Auth.getCurrentUser();
   
     var uploader = $scope.uploader = new FileUploader({
        url: '/api/adjunto/subir'
    });
    
    uploader.onBeforeUploadItem = function(item) {
     var   formData = [{
        IncidenteId:  $scope.incidente.idIncidente
    }];
    Array.prototype.push.apply(item.formData, formData);
    };
   uploader.onSuccessItem = function(fileItem, response, status, headers) {
        console.info('onSuccessItem', fileItem, response, status, headers);
    };
uploader.onCompleteAll = function() {
      $scope.openConfirmWithPreCloseCallbackInlinedWithNestedConfirm();
    };
    
    
    //$routeParams.id
    $http.get('/api/incidente/'+ $stateParams.id).
      success(function(data) {
        $scope.incidente = data;
        
        $http.get('/api/listas/incidente/estadosPermitidos/'+$scope.incidente.idEstado ).success(function(listasistema) {
      $scope.listas.estados  = listasistema;
    });
        
    $http.get('/api/listas/incidente/codigoTermino').success(function(listasistema) {
      $scope.listas.codigoTermino  = listasistema;
    });

$http.get('/api/listas/incidente/origenProblema').success(function(listasistema) {
      $scope.listas.origenProblema  = listasistema;
    });    
        $http.get('/api/listas/incidente/subTipoInicidente/' +$scope.incidente.idTipoIncidente).success(function(listadoModulos) {
      $scope.listas.modulo  = listadoModulos;
    });
    
     $http.get('/api/listas/listarConsultores').success(function(listasistema) {
      $scope.listas.consultor  = listasistema;
    })
      });



$scope.guardar =  function(){
   $scope.paginaValida = !$scope.formCrearIncidente.$error.required;
 console.log($scope.formCrearIncidente.$error)
  if (!$scope.paginaValida) return;

  $scope.incidente.usuario = Auth.getCurrentUser();
  
   $http.post('/api/incidente/guardarIncidente',$scope.incidente).
        success(function(data) {
          if (uploader.queue.length==0)
       $scope.openConfirmWithPreCloseCallbackInlinedWithNestedConfirm()
       else
       uploader.uploadAll()

        })
  


}

$scope.cerrarPagina = function (){
    
     $state.go('app.homeConsultor',null, {notify:true});
}
 
$scope.openConfirmWithPreCloseCallbackInlinedWithNestedConfirm = function () {
    ngDialog.openConfirm({
      template: 'dialogWithNestedConfirmDialogId2',
      className: 'ngdialog-theme-default',
      preCloseCallback: function(value) {

        var nestedConfirmDialog = ngDialog.openConfirm({
          template:
              '<p>estas seguro que quieres cerrar esta pagina?</p>' +
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