'use strict';

angular.module('myApp.items', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/items', {
    templateUrl: 'viewItems/items.html',
    controller: 'itemsCtrl'
  });
}])

.controller('itemsCtrl', ['$scope', '$http', function($scope, $http) {

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
            type: "file",
            class: "btn"
        }
    ];
    
    $scope.submitName = "Add item!";
    $scope.submitForm = function() {
        alert("Submitting form! " + $scope.inputs[0].ngModel);
    };

    if (logged_in()) {



        $http.get(PATH_TO_API + 'items/user_items?user_id='+ sessionStorage.getItem('user_id') +'&access_token=' + sessionStorage.getItem('access_token') ).then(function(data){

            for (var i=0; i<data.data.length; i++) {
                data.data[i].isAuction = false;
            }
             data.data[0].isAuction = true;
            $scope.items = data.data;
            
        }, function(data) { requestFailureFunction(data); });

    }

    $scope.edit_item = function() {
        
        alert("editing");
    };
    
}]);