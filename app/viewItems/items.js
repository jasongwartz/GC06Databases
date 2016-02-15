'use strict';

angular.module('myApp.items', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/items', {
    templateUrl: 'viewItems/items.html',
    controller: 'itemsCtrl'
  });
}])

.controller('itemsCtrl', ['$scope', '$http', function($scope, $http) {

    $scope.submitName = "Add item!";
    $scope.popupTitle = "Add an item!";
    $scope.inputs = [
        {
            label: "Item title",
            type: "text"
        },
        {
            label: "Item description",
            type: "textarea"
        },
        {
            label: "Item image",
            type: "file"
        }
    ];

    $scope.auction_submitName = "Auction item!";
    $scope.auction_popupTitle = "Auction an item!";
    $scope.auction_inputs = [
        {
            label: "Auction reserve price",
            type: "text"
        },
        {
            label: "End date",
            type: "date"
        }
    ];

    $scope.edit_submitName = "Auction item!";
    $scope.edit_popupTitle = "Auction an item!";
    $scope.edit_inputs = [];    

    if (logged_in()) {



        $http.get(PATH_TO_API + 'items/user_items?user_id='+ sessionStorage.getItem('user_id') +'&access_token=' + sessionStorage.getItem('access_token') ).then(function(data){

            for (var i=0; i<data.data.length; i++) {
                data.data[i].isAuction = false;
            }
             data.data[0].isAuction = true;
            $scope.items = data.data;
            
        }, function(data) { requestFailureFunction(data); });


        $scope.auction_item = function() {
            alert("auction item");
        };
        
        $scope.edit_item = function(item) {
            $scope.edit_inputs = [
                {
                    label: "Item title",
                    type: "text",
                    value: item.title
                },
                {
                    label: "Item description",
                    type: "textarea",
                    value: item.description
                },
                {
                    label: "Item image",
                    type: "file"
                }
            ];
//            alert("editing");
        };
        
        $scope.add_item = function() {
            alert("Submitting form! " + $scope.inputs[0].ngModel);
        };
    }


    
}]);