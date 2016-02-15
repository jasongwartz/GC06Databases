'use strict';

angular.module('myApp.items', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/items', {
    templateUrl: 'viewItems/items.html',
    controller: 'itemsCtrl'
  });
}])

.controller('itemsCtrl', ['$scope', '$http', function($scope, $http) {

    if (logged_in()) {

        $http.get(PATH_TO_API + 'items/user_items?user_id='+ sessionStorage.getItem('user_id') +'&access_token=' + sessionStorage.getItem('access_token') ).then(function(data){

            $scope.items = data.data;
        
        }, function(data) { requestFailureFunction(data); });

    }

    $scope.edit_item = function() {
        
        alert("editing");
    };
    
}]);