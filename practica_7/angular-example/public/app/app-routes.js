(function(){
  'use strict';
  angular
    .module('AngularDemo')
    .config(function($routeProvider){
      $routeProvider
      .when('/', {
          templateUrl: 'app/components/activities/activities.html',
          controller: 'activityCtrl',
          controllerAs: 'controller'
      })
      .when('/helloworld', {
          templateUrl: 'app/components/helloworld/helloworld.html'
      });
  });
})();
