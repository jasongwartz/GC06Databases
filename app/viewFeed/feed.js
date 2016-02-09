'use strict';

angular.module('myApp.feed', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/feed', {
    templateUrl: 'viewFeed/feed.html',
    controller: 'feedCtrl'
  });
}])

.controller('feedCtrl', ['$scope', '$http', '$rootScope', function($scope, $http, $rootScope) {

    $rootScope.logged_in = false;
    $scope.test = "afsdfsdf";
    $scope.auctions = [];
//    alert(sessionStorage.getItem('user_id'))
    $http.get(PATH_TO_API + 'users?id='+ sessionStorage.getItem('user_id') +'&access_token=' + sessionStorage.getItem('access_token') ).then(function(data){

        $scope.user = data.data[0];
    }, function() {
        alert("failed to find file.");
    });

    $http.get(PATH_TO_API + 'auctions/retrieve_all').then(function(data){
//        alert(data.data);
        $scope.auctions = data.data;
    }, function() {
        alert("failed to find file.");
    });
    
}]);