/**=========================================================
 * Module: flot-chart.js
 * Initializes the flot chart plugin and attaches the 
 * plugin to elements according to its type
 =========================================================*/

App.controller('home.superConsultor', ['$scope','$http','Auth','$filter','colors','ChartData', function($scope, $http,Auth,$filter,colors,ChartData) {
'use strict';


var randomScalingFactor = function(){ return Math.round(Math.random()*100)};

$scope.dashboard ={};
$scope.miFiltro ={};
$scope.getCurrentUser = Auth.getCurrentUser();
$scope.listas={};
$scope.anno=[{nombre:"2015",id:2015}]
$scope.meses =
[
    {mes:"Enero",id:1},
    {mes:"Febrero",id:2},
    {mes:"Marzo",id:3},
    {mes:"Abril",id:4},
    {mes:"Mayo",id:5},
    {mes:"Junio",id:6},
    {mes:"Julio",id:7},
    {mes:"Agosto",id:8},
    {mes:"Septiembre",id:9},
    {mes:"Octubre",id:10},
    {mes:"Noviembre",id:11},
    {mes:"Diciembre",id:12}
  ]





//Carga inicial de Combos.
$http.get('/api/listas/empresa').success(function(empresa) {
      $scope.listas.empresa  = empresa;
    });
var today = new Date();
$scope.dashboard.mes = today.getMonth();
$scope.dashboard.anno = today.getFullYear();
$scope.dashboard.idEmpresa = -1;

//Carga inicial de Combos.
$http.get('/api/incidente/estatusActual').success(function(dashboard) {
      $scope.dashboard.online  = dashboard;
      
      
    });



$scope.datos ={mes: $scope.dashboard.mes,anno:$scope.dashboard.anno,idEmpresa:$scope.dashboard.idEmpresa}
$http.post('/api/incidente/dashboard/porcentajeCumplimiento/',$scope.datos).
          success(function(data) {

$scope.dashboard.porcentajeMes = data.detalleCasos;

      $scope.dashboard.totalArea =[];
    var x = {}
    
x.totalCasos = data.totalCasos;
x.porcentajeCumplimiento = parseInt(data.porcentajeCumplimiento);
x.totalCumpleSLA = data .cumpleSLA
$scope.dashboard.totalArea.push(x);

          });

$http.post('/api/incidente/dashboard/incidentesKeyUser/',$scope.datos).
          success(function(data) {
$scope.dashboard.incidentesKeyUser = data;

          });


$http.post('/api/incidente/dashboard/incidentesPorSistema/',$scope.datos).
          success(function(data) {
          console.log('sdsd')    
var barSistemaData =[]
var barLabels = []
var barData = []
for (var i=0;i<=data.length-1;i++){
    
barLabels.push(data[i].tipoincidente.Nombre)
barData.push(data[i].count)
}

barSistemaData.labels =barLabels;
barSistemaData.datasets=[];
barSistemaData.datasets.push ({
          fillColor : colors.byName('info'),
          strokeColor : colors.byName('info'),
          highlightFill: colors.byName('info'),
          highlightStroke: colors.byName('info'),
          data :barData
        })

$scope.dashboard.incidentesPorSistema = barSistemaData;
console.log($scope.dashboard.incidentesPorSistema);
          });

$http.post('/api/incidente/dashboard/incidentesPorOrigenProblema/',$scope.datos).
          success(function(data) {
var bar=[]
for (var i=1;i<=data.length-1;i++)
bar.push(data[i])
console.log(bar)
 $scope.barStackeData = bar
 $scope.barStackeData2=ChartData.load('server/barstacked.json');
          }); 

$scope.actualizarDashboard = function (){
 $scope.datos ={mes: $scope.dashboard.mes,anno:$scope.dashboard.anno,idEmpresa:$scope.dashboard.idEmpresa} 
 
 
$http.post('/api/incidente/dashboard/incidentesKeyUser/',$scope.datos).
          success(function(data) {
$scope.dashboard.incidentesKeyUser = data;

          });
 
 
$http.post('/api/incidente/dashboard/incidentesPorOrigenProblema/',$scope.datos).
          success(function(data) {

var bar=[]
for (var i=1;i<=data.length-1;i++)
bar.push(data[i])
 console.log(bar)
 $scope.barStackeData = bar
 
 
          }); 
 
$http.post('/api/incidente/dashboard/porcentajeCumplimiento/',$scope.datos).
          success(function(data) {

$scope.dashboard.porcentajeMes = data.detalleCasos;

      $scope.dashboard.totalArea =[];
    var x = {}
    
x.totalCasos = data.totalCasos;
x.porcentajeCumplimiento = parseInt(data.porcentajeCumplimiento);
x.totalCumpleSLA = data .cumpleSLA
$scope.dashboard.totalArea.push(x);

          });




$http.post('/api/incidente/dashboard/incidentesPorSistema/',$scope.datos).
          success(function(data) {
          console.log('sdsd')    
var barSistemaData =[]
var barLabels = []
var barData = []
for (var i=0;i<=data.length-1;i++){
    
barLabels.push(data[i].tipoincidente.Nombre)
barData.push(data[i].count)
}

barSistemaData.labels =barLabels;
barSistemaData.datasets=[];
barSistemaData.datasets.push ({
          fillColor : colors.byName('info'),
          strokeColor : colors.byName('info'),
          highlightFill: colors.byName('info'),
          highlightStroke: colors.byName('info'),
          data :barData
        })

$scope.dashboard.incidentesPorSistema = barSistemaData;
console.log($scope.dashboard.incidentesPorSistema);
          });
}

  $scope.barStackedOptions = {
      series: {
          stack: true,
          bars: {
              align: 'center',
              lineWidth: 0,
              show: true,
              barWidth: 0.3,
              fill: 0.4
          }
      },
      grid: {
          borderColor: '#eee',
          borderWidth: 1,
          hoverable: true,
          backgroundColor: '#fcfcfc'
      },
      tooltip: true,
      tooltipOpts: {
          content: function (label, x, y) { return y + ' : ' + x }
      },
      xaxis: {
          tickColor: '#fcfcfc',
          mode: 'categories'
      },
      yaxis: {
          min: 0,
          position: ($scope.app.layout.isRTL ? 'right' : 'left'),
          tickColor: '#eee'
      },
      shadowSize: 0
  };



// Bar chart
// ----------------------------------- 

  $scope.barOptions = {
    scaleBeginAtZero : true,
    scaleShowGridLines : true,
    scaleGridLineColor : 'rgba(0,0,0,.05)',
    scaleGridLineWidth : 1,
    barShowStroke : true,
    barStrokeWidth : 2,
    barValueSpacing : 5,
    barDatasetSpacing : 1,
  };


 
        
}]);