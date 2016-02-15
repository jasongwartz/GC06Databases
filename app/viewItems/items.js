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

        $http.get(PATH_TO_API + 'users?id='+ sessionStorage.getItem('user_id') +'&access_token=' + sessionStorage.getItem('access_token') ).then(function(data){

            $scope.user = data.data[0];
        
        }, function(data) { requestFailureFunction(data); });

    }

    $scope.edit_item = function() {
        
        alert("editing");
    };
    
}]);