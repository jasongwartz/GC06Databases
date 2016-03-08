'use strict';

angular.module('controllers.bids', [])

.controller('bidsCtrl', ['$scope', '$http', function($scope, $http) {

    $scope.submitName = function(bid) {
        return "Pay £" + bid.bid_price + " now!";
    };
    $scope.popupTitle = "Make your payment!";
    $scope.inputs = [
        {
            label: "Cardholder name",
            type: "text"
        },
        {
            label: "Card number",
            type: "text"
        },
        {
            label: "Expiry date",
            type: "text"
        }
    ];
    $scope.pay = function() {
        alert("Well done!\nPayment made!");
    };
    
    
    get_user_bids();
    
    function get_user_bids() {
        $http.get(PATH_TO_API + 'bids/user_bids/?bidder_user_id=' 
                + sessionStorage.getItem('user_id') +'&access_token=' 
                + sessionStorage.getItem('access_token') ).then(function(data){

            $scope.bids = data.data;
        
        }, function(data) { requestFailureFunction(data); });
    }
    
}]);