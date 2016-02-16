'use strict';

angular.module('myApp.auction', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/auction', {
    templateUrl: 'viewAuction/auction.html',
    controller: 'auctionCtrl'
  });
}])

.controller('auctionCtrl', ['$scope', '$http', function($scope, $http) {

    $scope.popupTitle = "Make a bid!";
    $scope.inputs = [
        {
            label: "£",
            type: "number"
        }
    ];
    $scope.submitName = "Place bid!";
    $scope.submitForm = function() {
        alert("Submitting form! " + $scope.inputs[0].ngModel);
    };
    

    function dateFormatter(date){
//        alert(date);
        date = new Date(date);
        return date.getDate() + "/" + (date.getMonth()+1) + "/" + date.getFullYear() 
            + " " + date.getHours()+":"+ date.getMinutes()+":"+date.getSeconds();
    }

    var auction_id = window.location.href.split('?')[1];
    //alert(auction_id);
    $http.get(PATH_TO_API + 'auctions/?auction_id='+ auction_id ).then(function(data){

        $scope.auction = data.data[0];
        $scope.auction_end_time = dateFormatter($scope.auction.end_time);
//        alert(dateFormatter($scope.auction.end_time));
//        $scope.bids = [{bid:"asdasd"}];

    }, function(data) { requestFailureFunction(data); });


    $http.get(PATH_TO_API + 'bids/auction_bids?auction_id='+ auction_id ).then(function(data){

        $scope.bids = data.data;

    }, function(data) { requestFailureFunction(data); });
    
    
    $scope.add_bid = function() {
        
        alert("Adding a bid");
        //Has a popup with input fields
    }
    
}]);