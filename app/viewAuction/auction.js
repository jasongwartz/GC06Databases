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
    alert(auction_id);
    $http.get(PATH_TO_API + 'auctions/?auction_id='+ auction_id ).then(function(data){

        $scope.auction = data.data[0];
//        $scope.bids = [{bid:"asdasd"}];

    }, function(data) { requestFailureFunction(data); });


    $http.get(PATH_TO_API + 'bids/auction_bids?auction_id='+ auction_id ).then(function(data){

        $scope.bids = data.data[0];

    }, function(data) { requestFailureFunction(data); });
    
}]);