'use strict';

angular.module('myApp.account', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/account', {
    templateUrl: 'account/account.html',
    controller: 'AccountCtrl'
  });
}])

.controller('AccountCtrl', ['$scope', '$http', function($scope, $http) {

    $scope.test = "afsdfsdf";

    $http.get('/hashtagories/api/api_calls/get_user.php').then(function(data){
        alert(data.data);
        $scope.test = data.data.result;
    }, function() {
        alert("failed to find file.");
    });

    
}]);