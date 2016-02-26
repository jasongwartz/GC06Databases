'use strict';

angular.module('controller.feed', ['ngRoute'])

.controller('feedCtrl', ['$scope', '$http', '$rootScope', function($scope, $http, $rootScope) {

    
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
    
    $http.get(PATH_TO_API + 'auctions/retrieve_all').then(function(data){
    //        alert(data.data);
    
        $scope.auctions = data.data;
        
    }, function(data) { requestFailureFunction(data); });
}]);