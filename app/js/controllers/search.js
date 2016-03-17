'use strict';

angular.module('controllers.search', [])

.controller('searchCtrl', ['$scope', '$http', '$rootScope', '$routeParams', '$location', function($scope, $http, $rootScope, $routeParams, $location) {

    $rootScope.progressbar.start();
    setTimeout(function() {$rootScope.progressbar.complete();}, 2000);

    var id = $location.search().sort;

    $('document').ready(function(){
//        alert(id);
        document.getElementById(id).checked = true;

    });

    $scope.auctions = [];

    get_trending();
    get_search();


    function get_trending() {
        var path = PATH_TO_API + "hashtagories/trending/";
        $http.get(path).then(function(data){
             $scope.trends = data.data;
        }, function(data) { requestFailureFunction(data); });        
        
    }
    
    function get_search() {
        var path_with_params = PATH_TO_API + 'auctions/search?';
        
        var params = $location.search();
        
        path_with_params += (params.query ? "query=" + params.query + "&" : "");
        path_with_params += (params.sort_order ? "sort_order=" + params.sort_order + "&" : "");
        path_with_params += (params.sort ? "sort=" + params.sort : "");
        
        // alert(path_with_params);
        
        $http.get(path_with_params).then(function(data){
             $scope.auctions = data.data;
        }, function(data) { requestFailureFunction(data); });
    }
}]);