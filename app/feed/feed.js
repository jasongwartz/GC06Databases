'use strict';

angular.module('myApp.feed', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/feed', {
    templateUrl: 'feed/feed.html',
    controller: 'FeedCtrl'
  });
}])

.controller('FeedCtrl', ['$scope', '$http', function($scope, $http) {

    $scope.test = "afsdfsdf";

    $http.get('/hashtagories/api/api_calls/get_user.php').then(function(data){
        alert(data.data);
        $scope.test = data.data.result;
    }, function() {
        alert("failed to find file.");
    });

    
}]);