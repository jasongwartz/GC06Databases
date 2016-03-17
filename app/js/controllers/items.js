'use strict';

angular.module('controllers.items', [])

.controller('itemsCtrl', ['$scope', 'http', '$rootScope', function($scope, $http, $rootScope) {

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
            label: "Item image ref",
            type: "text"
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


        get_all_items();
    }

    function get_all_items() {
        
        $http.get(PATH_TO_API + 'auctions/user_auctions?user_id='+ sessionStorage.getItem('user_id') +'&access_token=' + sessionStorage.getItem('access_token') ).then(function(data){

//            alert(JSON.stringify(data));
            $scope.auction_items = data.data;
            get_items();
        }, function() { 
            $scope.auction_items = [];
//           alert("getting items");
            get_items();            
        //requestFailureFunction(data); 
        });
    }

    function get_items() {
        

        $http.get(PATH_TO_API + 'items/user_items?user_id='+ sessionStorage.getItem('user_id') +'&access_token=' + sessionStorage.getItem('access_token') ).then(function(data){

            //alert(JSON.stringify(data))
            for (var i=0; i<data.data.length; i++) {
                for (var j=0; j<$scope.auction_items.length; j++) {
                    if (data.data[i].item_id === $scope.auction_items[j].item_id && $scope.auction_items[j].is_complete < 1 ) {
                        data.data.splice(i, 1);
                    }

                }
            }
//             data.data[0].isAuction = true;

            $scope.items = data.data;

        }, function(data) { requestFailureFunction(data); });        
        
    }
    
    function sql_date(date) {
        return date.getUTCFullYear() + '-' +
        ('00' + (date.getUTCMonth() + 1)).slice(-2) + '-' +
        ('00' + date.getUTCDate()).slice(-2) + ' ' +
        ('00' + date.getUTCHours()).slice(-2) + ':' +
        ('00' + date.getUTCMinutes()).slice(-2) + ':' +
        ('00' + date.getUTCSeconds()).slice(-2);  
    }
    
        $scope.delete_item = function(item) {
            
            if (confirm("Delete your item '" + item.title + "'?")) {
                var post_data = $.param({
                        item_id: item.item_id
                    });


                var url = PATH_TO_API + 'items/delete/?access_token=' + sessionStorage.getItem('access_token');
                //alert(post_data + " to " + url);
                $http({
                    method: 'POST',
                    url: url,
                    data: post_data,
                    headers: {'Content-Type': 'application/x-www-form-urlencoded'}
                }).then(function(data){
                    //alert(JSON.stringify(data))
                    alert("Item deleted!"); //Needs to be here...
                    
                    get_all_items();

                }, function(data) { //requestFailureFunction(data); 
                    //alert(JSON.stringify(data))
                    get_all_items();
                });
            }
        };



        $scope.auction_item = function(item) {
            
            //alert(item.item_id + " " + $scope.edit_inputs[0].ngModel + " " + $scope.edit_inputs[1].ngModel);
            var post_data = $.param({

                    auction_item_id: item.item_id,
                    start_time:  sql_date(new Date()),
                    end_time: sql_date(new Date($scope.auction_inputs[1].ngModel)),
                    reserve_price: $scope.auction_inputs[0].ngModel

                });

                
            var url = PATH_TO_API + 'auctions/create/?access_token=' + sessionStorage.getItem('access_token');
            //alert(post_data + " to " + url);
            $http({
                method: 'POST',
                url: url,
                data: post_data,
                headers: {'Content-Type': 'application/x-www-form-urlencoded'}
            }).then(function(data){
                alert(JSON.stringify(data))
                alert("Auction created!"); //Needs to be here...
                
                get_all_items();

            }, function(data) { //requestFailureFunction(data); 
                //alert(JSON.stringify(data))
                get_all_items();
            });
            
        };
        
        $scope.setup_edit = function(item) {
//            alert("\csdsadsd " + item.title + " "+ item.description);
            //alert(item.image_ref);
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
                    label: "Item image ref",
                    type: "text",
                    ngModel: item.image_ref
                }
            ];            
        };
        
        $scope.edit_item = function(item) {
            //alert(item.item_id + " " + $scope.edit_inputs[0].ngModel + " " + $scope.edit_inputs[1].ngModel);
            //alert(item.item_id)
            var post_data = $.param({

                    item_id: item.item_id,
                    title: $scope.edit_inputs[0].ngModel ,
                    description: $scope.edit_inputs[1].ngModel,      
                    image_ref: $scope.edit_inputs[2].ngModel      

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
            //alert("Submitting form! " + $scope.inputs[0].ngModel);
            var post_data = $.param({

                    owner_user_id: sessionStorage.getItem('user_id'),
                    title: $scope.inputs[0].ngModel ,
                    description: $scope.inputs[1].ngModel,      
                    image_ref: $scope.inputs[2].ngModel      

                });


            var url = PATH_TO_API + 'items/create/?access_token=' + sessionStorage.getItem('access_token');
    //        alert(post_data + " to " + url);
            $http({
                method: 'POST',
                url: url,
                data: post_data,
                headers: {'Content-Type': 'application/x-www-form-urlencoded'}
            }).then(function(data){
                
                if (!data.data.error) {
                //alert(JSON.stringify(data))
                    alert("Item added!"); //Needs to be here...
                    get_items();
                
                } else {
                    var str = "Please fill in all fields.";

//                    for (var i=0; i<data.data.error.length; i++) {
//                        str += data.data.error[i] + "\n";
//                    }

                    alert(str);
                }

            }, function(data) { //requestFailureFunction(data); 
//                alert(JSON.stringify(data))
                get_items();
            });
        };

    
}]);