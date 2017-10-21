(function(){
  'use strict';

  angular.module('AngularDemo')
    .controller('activityCtrl', ['$scope', function($scope){
      var controller = this;

      controller.list = [{status: true, description: 'Add view'},{status: false, description: 'Make it work'},{status: false, description: 'Clean code'}];

      controller.addTask = function(){
        controller.list.push({status: false, description: controller.newTask});
        controller.newTask = "";
      };
    }]);
})();
