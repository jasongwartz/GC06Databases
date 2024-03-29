'use strict';

angular.module('controllers.search', [])

.controller('searchCtrl', ['$scope', 'http', '$rootScope', '$routeParams', '$location', function($scope, $http, $rootScope, $routeParams, $location) {

    var params = $location.search();
    var id = params.sort;

    $('document').ready(function(){
//        alert(id);
        var rgx = /title/;
        if (rgx.test(id)) {
            
            if (parseInt(params.sort_order) === 0) {
                id += "_az";
            } else {
                id += "_za";
            }
        }
        rgx = /views/;
        if (rgx.test(id)) {
            
            if (parseInt(params.sort_order) === 1) {
                id += "_m";
            } else {
                id += "_l";
            }
        }
//        alert(id);
        if (document.getElementById(id))
            document.getElementById(id).checked = true;

    });

    $scope.auctions = [];

    get_trending();
    get_search();

//        var post_data = $.param({
//            username: "asdasdads",
//            password: "asdasd"
//        });
//
//        var url = PATH_TO_API + 'users/authenticate/';
//        //alert(post_data + " to " + url);
//        $http({
//            method: 'POST',
//            url: url,
//            data: post_data,
//            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
//        }).then(function(data){
//
//            alert("success");
//
//        }, function(data) { 
//            alert(data.data.error);
//        });

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