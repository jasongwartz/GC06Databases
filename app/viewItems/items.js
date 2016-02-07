'use strict';

angular.module('myApp.items', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/items', {
    templateUrl: 'viewItems/items.html',
    controller: 'itemsCtrl'
  });
}])

.controller('itemsCtrl', ['$scope', '$http', function($scope, $http) {

    $scope.test = "afsdfsdf";

    $http.get('/hashtagories/api/api_calls/get_user.php').then(function(data){
        alert(data.data);
        $scope.test = data.data.result;
    }, function() {
        alert("failed to find file.");
    });

    
}]);