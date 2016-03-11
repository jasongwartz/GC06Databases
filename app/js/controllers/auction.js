'use strict';

angular.module('controllers.auction', [])

.controller('auctionCtrl', ['$scope', '$http', '$rootScope', function($scope, $http, $rootScope) {

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
    
    var auction_id = window.location.href.split('?')[1];
    
    //$scope.isInWatches = isInWatches(auction_id);
    
    get_bids(auction_id);
    //alert(auction_id);
    $http.get(PATH_TO_API + 'auctions/?auction_id='+ auction_id ).then(function(data){

        $scope.auction = data.data[0];
        $scope.auction_end_time = dateFormatter($scope.auction.end_time);
//        alert(dateFormatter($scope.auction.end_time));
//        $scope.bids = [{bid:"asdasd"}];

    }, function(data) { requestFailureFunction(data); });

    function get_bids(auction_id) {

        $http.get(PATH_TO_API + 'bids/auction_bids?auction_id='+ auction_id ).then(function(data){

            $scope.bids = data.data;
            alert(JSON.stringify($scope.bids))

        }, function(data) { requestFailureFunction(data); });
    }
        
    $scope.place_bid = function() {
        if ($scope.bids == [] || $scope.inputs[0].ngModel > $scope.bids[0].bid_price)
            {
                var post_data = $.param({
                
                bidder_user_id: sessionStorage.getItem("user_id"),
                bid_auction_id: auction_id,
                bid_price: $scope.inputs[0].ngModel      
              
            });
            
        //alert(post_data);
        var url = PATH_TO_API + 'bids/create/?access_token=' + sessionStorage.getItem('access_token');
//        alert(post_data + " to " + url);
        $http({
            method: 'POST',
            url: url,
            data: post_data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).then(function(data){

            alert("Bid placed!");
            get_bids(auction_id);

        }, function(data) { //requestFailureFunction(data); 
            get_bids();
        });

            }
        else
            {
                alert("You must bid more than "+$scope.bids[0].bid_price)
            }
        
    };
    


    function dateFormatter(date){
//        alert(date);
        date = new Date(date);
        return date.getDate() + "/" + (date.getMonth()+1) + "/" + date.getFullYear() 
            + " " + date.getHours()+":"+ date.getMinutes()+":"+date.getSeconds();
    }    
    
}]);