'use strict';

angular.module('myApp.auction', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/auction', {
    templateUrl: 'viewAuction/auction.html',
    controller: 'auctionCtrl'
  });
}])

.controller('auctionCtrl', ['$scope', '$http', function($scope, $http) {

    var auction_id = window.location.href.split('?')[1];

        $http.get(PATH_TO_API + 'auctions?id='+ auction_id ).then(function(data){

            $scope.user = data.data[0];
            
        }, function(data) { requestFailureFunction(data); });


    
}]);