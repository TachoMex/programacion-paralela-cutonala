(function(){
  'use strict';

  angular
    .module('AngularDemo')
    .factory('activitie', function($http){
      var service = {};
      service.getActivities = function(callback){
        $http.get('/activities/').success(function(data){
          callback(data);
        });
      };

      service.close = function(activitie, callback){
        $http.post('/activities/close/' + activitie.activitieId).success(callback);
      };

      service.edit = function(activitie, callback){
        $http.post('/activities/edit/' + activitie.activitieId, activitie).success(callback);
      };

      service.delete = function(activitie, callback){
        $http.post('/activities/delete/' + activitie.activitieId).success(callback);
      };

      service.put = function(data, callback){
        $http.post('/activities/new/', data).success(callback);
      };

      return service;
    });
})();
