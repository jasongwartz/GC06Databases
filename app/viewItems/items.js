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

    $scope.edit_submitName = "Edit item!";
    $scope.edit_popupTitle = "Edit an item!";
    $scope.edit_inputs = [];    

//    $scope.items = [
//        {
//            title: "asdasd",
//            description: "asdadasdasd"
//        }
//    ];

    if (logged_in()) {


        $http.get(PATH_TO_API + 'auctions/user_auctions?user_id='+ sessionStorage.getItem('user_id') +'&access_token=' + sessionStorage.getItem('access_token') ).then(function(data){

//            alert(JSON.stringify(data));
            $scope.auction_items = data.data;
           
            $http.get(PATH_TO_API + 'items/user_items?user_id='+ sessionStorage.getItem('user_id') +'&access_token=' + sessionStorage.getItem('access_token') ).then(function(data){

                for (var i=0; i<data.data.length; i++) {
                    for (var j=0; j<$scope.auction_items.length; j++) {
                        if (data.data[i].item_id === $scope.auction_items[j].item_id && $scope.auction_items[j].is_complete !== 1 ) {
                            data.data.splice(i, 1);
                        }
                    
                    }
                }
    //             data.data[0].isAuction = true;
        
                $scope.items = data.data;

            }, function(data) { requestFailureFunction(data); });
        }, function(data) { requestFailureFunction(data); });





    }

        $scope.delete_item = function() {
            
            alert("Deleting");
        };

        $scope.auction_item = function() {
            alert("auction item");
        };
        
        $scope.setup_edit = function(item) {
//            alert("\csdsadsd " + item.title + " "+ item.description);
            $scope.edit_inputs = [
                {
                    label: "Item title",
                    type: "text",
                    ngModel: item.title
                },
                {
                    label: "Item description",
                    type: "textarea",
                    ngModel: item.description
                },
                {
                    label: "Item image",
                    type: "file"
                }
            ];            
        }
        
        $scope.edit_item = function(item) {

            alert("editing");
        };
        
        $scope.add_item = function() {
            alert("Submitting form! " + $scope.inputs[0].ngModel);
        };

    
}]);