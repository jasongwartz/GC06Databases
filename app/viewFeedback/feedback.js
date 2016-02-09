'use strict';

angular.module('myApp.feedback', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/feedback', {
    templateUrl: 'viewFeedback/feedback.html',
    controller: 'feedbackCtrl'
  });
}])

.controller('feedbackCtrl', ['$scope', '$http', function($scope, $http) {

    if (logged_in()) {

//    alert(sessionStorage.getItem('user_id'))
        $http.get(PATH_TO_API + 'users?id='+ sessionStorage.getItem('user_id') +'&access_token=' + sessionStorage.getItem('access_token') ).then(function(data){

            $scope.user = data.data[0];
        }, function() {
            alert("failed to find file.");
        });


    }

    
}]);