'use strict';

angular.module('myApp.login', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/login', {
    templateUrl: 'viewLogin/login.html',
    controller: 'loginCtrl'
  });
}])

.controller('loginCtrl', ['$scope', '$http', function($scope, $http) {

    $scope.login = function() {
        
        $http.get(PATH_TO_API + 'auth').then(function(data){

            alert(data.data);
            
            sessionStorage.setItem('access_token', data.data.access_token);
            sessionStorage.setItem('user_id', JSON.stringify(data.data.user_id));
            
            window.location.href = '#/feed';
        }, function() {
            alert("failed to find file.");
        });   
        
    };
    
}]);