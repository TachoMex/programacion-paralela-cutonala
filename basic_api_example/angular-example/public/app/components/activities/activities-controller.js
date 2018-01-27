(function(){
  'use strict';

  angular.module('AngularDemo')
    .controller('activityCtrl', ['$scope', 'Tasks', function($scope, tasks){
      var controller = this;

      controller.loadTasks = function(){
        tasks.getActivities('tacho', function(data){
          console.log(data);
          if(data.status === 'success'){
            controller.list = data.data;
          }
        });
      };

      controller.loadTasks();

      controller.addTask = function(){
        tasks.addActivitie('tacho', controller.newTask, function(data){
          console.log(data);
          if(data.status === 'success'){
            controller.list.push(data.data);
          }
        });
      };
    }]);
})();
