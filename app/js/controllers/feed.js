'use strict';

angular.module('controllers.feed', [])

.controller('feedCtrl', ['$scope', 'http', '$rootScope', function($scope, $http, $rootScope) {

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
    
    
}]);