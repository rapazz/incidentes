/**=========================================================
 * Module: constants.js
 * Define constants to inject across the application
 =========================================================*/
App
  .constant('APP_COLORS', {
    'primary':                '#5d9cec',
    'success':                '#27c24c',
    'info':                   '#23b7e5',
    'warning':                '#ff902b',
    'danger':                 '#f05050',
    'inverse':                '#131e26',
    'green':                  '#37bc9b',
    'pink':                   '#f532e5',
    'purple':                 '#7266ba',
    'dark':                   '#3a3f51',
    'yellow':                 '#fad732',
    'gray-darker':            '#232735',
    'gray-dark':              '#3a3f51',
    'gray':                   '#dde6e9',
    'gray-light':             '#e4eaec',
    'gray-lighter':           '#edf1f2'
  })
  .constant('APP_MEDIAQUERY', {
    'desktopLG':             1200,
    'desktop':                992,
    'tablet':                 768,
    'mobile':                 480
  })
  .constant('APP_REQUIRES', {
    // jQuery based and standalone scripts
    scripts: {
      'modernizr':          ['vendor/modernizr/modernizr.js'],
      'chartjs':            ['vendor/Chart.js/Chart.js'],
      'slimscroll':         ['vendor/slimScroll/jquery.slimscroll.min.js'],
      'classyloader':       ['vendor/jquery-classyloader/js/jquery.classyloader.min.js'],
      'icons':              ['vendor/fontawesome/css/font-awesome.min.css',
                             'vendor/simple-line-icons/css/simple-line-icons.css'],
       'parsley':            ['vendor/parsleyjs/dist/parsley.min.js'],
      'filestyle':          ['vendor/bootstrap-filestyle/src/bootstrap-filestyle.js'],
      'flot-chart':         ['vendor/Flot/jquery.flot.js'],
      'flot-chart-plugins': ['vendor/flot.tooltip/js/jquery.flot.tooltip.min.js',
                             'vendor/Flot/jquery.flot.resize.js',
                             'vendor/Flot/jquery.flot.pie.js',
                             'vendor/Flot/jquery.flot.time.js',
                             'vendor/Flot/jquery.flot.categories.js',
                             'vendor/flot-spline/js/jquery.flot.spline.min.js',
                             'vendor/Flot/jquery.flot.stack.js']
    },
    // Angular based script (use the right module name)
    modules: [
      {name: 'toaster',                   files: ['vendor/angularjs-toaster/toaster.js',
                                                 'vendor/angularjs-toaster/toaster.css']},
      {name: 'angularFileUpload',         files: ['vendor/angular-file-upload/angular-file-upload.js']},
      {name: 'ngDialog',                  files: ['vendor/ngDialog/js/ngDialog.min.js',
                                                 'vendor/ngDialog/css/ngDialog.min.css',
                                                 'vendor/ngDialog/css/ngDialog-theme-default.min.css'] }
      // { name: 'toaster', files: ['vendor/angularjs-toaster/toaster.js','vendor/angularjs-toaster/toaster.css'] }
    ]

  })
  .constant('APP_ANOS',{
    "2015":2015,
    "2016":2016
  })
  .constant('APP_MESES',{
    "Enero":1,
    "Febrero":2,
    "Marzo":3,
    "Abril":4,
    "Mayo":5,
    "Junio":6,
    "Julio":7,
    "Agosto":8,
    "Septiembre":9,
    "Octubre":10,
    "Noviembre":11,
    "Diciembre":12
  })
;