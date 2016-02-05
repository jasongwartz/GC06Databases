'use strict';

angular.module('myApp.auction', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/auction', {
    templateUrl: 'auction/auction.html',
    controller: 'auctionCtrl'
  });
}])

.controller('auctionCtrl', ['$scope', '$http', function($scope, $http) {

    $scope.test = "afsdfsdf";

    $http.get('/hashtagories/api/api_calls/get_user.php').then(function(data){
        alert(data.data);
        $scope.test = data.data.result;
    }, function() {
        alert("failed to find file.");
    });

    
}]);