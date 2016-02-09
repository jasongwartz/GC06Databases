'use strict';

angular.module('myApp.account', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/account', {
    templateUrl: 'viewAccount/account.html',
    controller: 'AccountCtrl'
  });
}])

.controller('AccountCtrl', ['$scope', '$http', function($scope, $http) {

    if (logged_in()) {

//    alert(sessionStorage.getItem('user_id'))
        $http.get(PATH_TO_API + 'users?id='+ sessionStorage.getItem('user_id') +'&access_token=' + sessionStorage.getItem('access_token') ).then(function(data){

            $scope.user = data.data[0];
        }, function() {
            alert("failed to find file.");
        });


    }
    
}]);