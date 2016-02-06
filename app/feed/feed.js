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

    $http.get('/hashtagories/api/the_api/users?p=test').then(function(data){
        alert(data.data);
        $scope.test = data;
    }, function() {
        alert("failed to find file.");
    });

    
}]);