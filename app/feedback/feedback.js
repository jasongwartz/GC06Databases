'use strict';

angular.module('myApp.feedback', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/feedback', {
    templateUrl: 'feedback/feedback.html',
    controller: 'feedbackCtrl'
  });
}])

.controller('feedbackCtrl', ['$scope', '$http', function($scope, $http) {

    $scope.test = "afsdfsdf";

    $http.get('/hashtagories/api/api_calls/get_user.php').then(function(data){
        alert(data.data);
        $scope.test = data.data.result;
    }, function() {
        alert("failed to find file.");
    });

    
}]);