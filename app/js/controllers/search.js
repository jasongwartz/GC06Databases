'use strict';

angular.module('controllers.search', [])

.controller('searchCtrl', ['$scope', '$http', '$rootScope', '$routeParams', '$location', function($scope, $http, $rootScope, $routeParams, $location) {

    var id = $location.search().sort;

    $('document').ready(function(){
//        alert(id);
        document.getElementById(id).checked = true;

    });

    $scope.auctions = [];

    get_trending();

    function get_trending() {
        var path = PATH_TO_API + "hashtagories/trending/";
        $http.get(path).then(function(data){
             $scope.trends = data.data;
        }, function(data) { requestFailureFunction(data); });        
        
    }
        
    var path_with_params = PATH_TO_API + 'auctions/search?query='+encodeURIComponent($routeParams['query']);
    $http.get(path_with_params).then(function(data){
         $scope.auctions = data.data;
    }, function(data) { requestFailureFunction(data); });
}]);