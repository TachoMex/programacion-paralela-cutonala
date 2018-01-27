(function (){
  'use strict';
  angular
    .module('AngularDemo')
    .controller('MainCtrl', ['$scope', '$http', '$route', '$routeParams', '$location', '$localStorage',
    function($scope, $http, $route, $routeParams, $location, $localStorage) {
      var controller = this;
      controller.$route = $route;
      controller.$location = $location;
      controller.$routeParams = $routeParams;
  }]);
})();
