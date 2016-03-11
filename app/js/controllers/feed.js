'use strict';

angular.module('controllers.feed', [])

.controller('feedCtrl', ['$scope', '$http', function($scope, $http) {

    $scope.auctions = [];

    get_trending();

    function get_trending() {
        var path = PATH_TO_API + "hashtagories/trending/";
        $http.get(path).then(function(data){
             $scope.trends = data.data;
        }, function(data) { /*requestFailureFunction(data);*/ });        
        
    }

    
    $http.get(PATH_TO_API + 'auctions/retrieve_all').then(function(data){
    //        alert(data.data);

        $scope.auctions = data.data;

    }, function(data) { /*requestFailureFunction(data);*/ });    
    
//    switch($rootScope.filter) { 
//
//        case "SEARCH":
//            var path_with_params = PATH_TO_API + 'auctions/search?query='+encodeURIComponent($routeParams['query']);
//            $http.get(path_with_params).then(function(data){
//                 $scope.auctions = data.data
//            }, function(data) { requestFailureFunction(data); });
//        break
//        
//        case "WATCH" :
//
//            
//
//        break;
//        
//        default:
//
//        break;
//        
//    }
}]);