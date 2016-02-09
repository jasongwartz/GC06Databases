'use strict';

angular.module('myApp.auction', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/auction', {
    templateUrl: 'viewAuction/auction.html',
    controller: 'auctionCtrl'
  });
}])

.controller('auctionCtrl', ['$scope', '$http', function($scope, $http) {

    if (logged_in()) {

        $http.get(PATH_TO_API + 'users?id='+ sessionStorage.getItem('user_id') +'&access_token=' + sessionStorage.getItem('access_token') ).then(function(data){

            $scope.user = data.data[0];
        }, function() {
            alert("failed to find file.");
        });

    }

    
}]);