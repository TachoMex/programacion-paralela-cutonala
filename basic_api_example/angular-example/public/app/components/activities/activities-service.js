(function(){
  'use strict';

  angular
    .module('AngularDemo')
    .factory('Tasks', function($http){
      var service = {};
      service.getActivities = function(user, callback){
        $http.get('api/todo/' + user).success(function(data){
          callback(data);
        });
      };

      service.addActivitie = function(user, description, callback) {
        $http.post('api/todo/' + user, { description: description }).success(function(data){
          callback(data);
        });
      };

      service.put = function(data, callback){
        $http.post('/activities/new/', data).success(callback);
      };

      return service;
    });
})();
