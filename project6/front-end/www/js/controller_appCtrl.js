angular.module('starter.controllers', ['dataservices'])

.controller('AppCtrl', ['$scope', 'localStorage', function($scope, localStorage){
  // zet de data van localstorage in een scope
  var data = localStorage.getObject('userdata');
  if (data) {
    $scope.oefeningen = data.Exercises;
    $scope.data = data;
  }
}])


