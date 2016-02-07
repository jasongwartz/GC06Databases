'use strict';

angular.module('myApp.feed', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/feed', {
    templateUrl: 'viewFeed/feed.html',
    controller: 'feedCtrl'
  });
}])

.controller('feedCtrl', ['$scope', '$http', function($scope, $http) {

    $scope.test = "afsdfsdf";
$scope.auctions = [];
    $http.get('/hashtagories/api/users?id=1').then(function(data){
//        alert(data.data);
        $scope.auctions = [
            {
                item_name: "mug",
                item_description: "its a mug"
            },
            {
                item_name: "cup",
                item_description: "its a cup"
            }
        ];

        $scope.user = data.data[0];
    }, function() {
        alert("failed to find file.");
    });

    
}]);