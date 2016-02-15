'use strict';

angular.module('myApp.login', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/login', {
    templateUrl: 'viewLogin/login.html',
    controller: 'loginCtrl'
  });
}])

.controller('loginCtrl', ['$scope', '$http', '$rootScope',function($scope, $http, $rootScope) {

    $scope.login = function() {
        
        $http.get(PATH_TO_API + 'auth').then(function(data){

            $rootScope.logged_in = true;

//            alert(data.data + ' ' + $rootScope.logged_in);
            
            sessionStorage.setItem('logged_in', JSON.stringify(true));
            
            sessionStorage.setItem('access_token', data.data.access_token);
            sessionStorage.setItem('user_id', JSON.stringify(data.data.user_id));
            
            window.location.href = '#/feed';
        
        }, function(data) { requestFailureFunction(data); });
        
    };
    
}]);