'use strict';

angular.module('controllers.feed', [])

.controller('feedCtrl', ['$scope', '$http', '$rootScope', '$routeParams', function($scope, $http, $rootScope, $routeParams) {

    
    $scope.auctions = [];

//    if (logged_in()) {
//
////    alert(sessionStorage.getItem('user_id'))
//        $http.get(PATH_TO_API + 'users?user_id='+ sessionStorage.getItem('user_id') +'&access_token=' + sessionStorage.getItem('access_token') ).then(function(data){
//
//            $scope.user = data.data[0];
//            
//        }, function(data) { requestFailureFunction(data); });
//
//
//    }
    
    console.log($rootScope.filter);
    
    
    switch($rootScope.filter) { 

        case "SEARCH":
            console.log($routeParams)
            $http.get(PATH_TO_API + 'auctions/search?query="'+$routeParams['query']+'"').then(function(data){
                 $scope.auctions = data.data
            }, function(data) { requestFailureFunction(data); })
        break
        
        case "WATCH" :

            $scope.auctions = $rootScope.watches;

        break;
        
        default:
            $http.get(PATH_TO_API + 'auctions/retrieve_all').then(function(data){
            //        alert(data.data);

                $scope.auctions = data.data;

            }, function(data) { requestFailureFunction(data); });
        break;
        
    }
}]);