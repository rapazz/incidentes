App.controller('incidente.crearIncidente', ['$scope','Auth','$http','FileUploader','ngDialog','$state', function($scope,Auth,$http,FileUploader,ngDialog,$state) {
    
     $scope.incidente={};
    $scope.listas ={};
    $scope.getCurrentUser = Auth.getCurrentUser();
     var uploader = $scope.uploader = new FileUploader({
        url: '/api/adjunto/subir'
    });

    // FILTERS

$scope.cerrarPagina = function (){
    
     $state.go($rootScope.user.dashboard,null, {notify:true});
}

uploader.onBeforeUploadItem = function(item) {
     var   formData = [{
        IncidenteId:  $scope.IncidenteId
    }];
    Array.prototype.push.apply(item.formData, formData);
    };
   uploader.onSuccessItem = function(fileItem, response, status, headers) {
        console.info('onSuccessItem', fileItem, response, status, headers);
    };
uploader.onCompleteAll = function() {
      $scope.openConfirmWithPreCloseCallbackInlinedWithNestedConfirm();
    };
  
    
    
    
      $http.get('/api/listas/incidente/tipoInicidente').success(function(listasistema) {
      $scope.listas.sistema  = listasistema;
    });
    
    $scope.cargaModulo= function(){
    
    $http.get('/api/listas/incidente/subTipoInicidente/' +$scope.incidente.idTipoIncidente).success(function(listadoModulos) {
      $scope.listas.modulo  = listadoModulos;
    });
    
}
    
    
       $scope.grabarIncidente = function() {

     $scope.paginaValida = !$scope.formCrearIncidente.$error.required;

if (!$scope.paginaValida) return;


      $scope.incidente["usuario"] = $scope.getCurrentUser.email;
      $scope.incidente["IdInterno"] = $scope.IncidenteId;
       $scope.incidente.usuario  = $scope.getCurrentUser

     $http.post('/api/incidente/',$scope.incidente).
        success(function(data) {
       $scope.IncidenteId=data.idIncidente;
       console.log(data)
       if (uploader.queue.length==0)
       $scope.openConfirmWithPreCloseCallbackInlinedWithNestedConfirm()
       else
       uploader.uploadAll()
        })

      $scope.esgrabado = true;



     
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