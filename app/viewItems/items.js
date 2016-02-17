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
            type: "datetime-local"
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
            get_items();
        }, function() { 
            $scope.auction_items = [];
           alert("getting items");
            get_items();            
        //requestFailureFunction(data); 
        });





    }

    function get_items() {
        

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
        };
        
        $scope.edit_item = function(item) {
            //alert(item.item_id + " " + $scope.edit_inputs[0].ngModel + " " + $scope.edit_inputs[1].ngModel);
            var post_data = $.param({

                    item_id: item.item_id,
                    title: $scope.edit_inputs[0].ngModel ,
                    description: $scope.edit_inputs[1].ngModel      

                });


            var url = PATH_TO_API + 'items/update/?access_token=' + sessionStorage.getItem('access_token');
    //        alert(post_data + " to " + url);
            $http({
                method: 'POST',
                url: url,
                data: post_data,
                headers: {'Content-Type': 'application/x-www-form-urlencoded'}
            }).then(function(data){
//                alert(JSON.stringify(data))
                alert("Edit made!"); //Needs to be here...
                get_items();

            }, function(data) { //requestFailureFunction(data); 
//                alert(JSON.stringify(data))
                get_items();
            });
        };
        
        $scope.add_item = function() {
            alert("Submitting form! " + $scope.inputs[0].ngModel);
            var post_data = $.param({

                    owner_user_id: sessionStorage.getItem('user_id'),
                    title: $scope.inputs[0].ngModel ,
                    description: $scope.inputs[1].ngModel      

                });


            var url = PATH_TO_API + 'items/create/?access_token=' + sessionStorage.getItem('access_token');
    //        alert(post_data + " to " + url);
            $http({
                method: 'POST',
                url: url,
                data: post_data,
                headers: {'Content-Type': 'application/x-www-form-urlencoded'}
            }).then(function(data){
                alert(JSON.stringify(data))
                alert("Item added!"); //Needs to be here...
                get_items();

            }, function(data) { //requestFailureFunction(data); 
//                alert(JSON.stringify(data))
                get_items();
            });
        };

    
}]);