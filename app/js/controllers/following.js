'use strict';

angular.module('controllers.following', [])

.controller('followingCtrl', ['$scope', '$http', '$rootScope', function($scope, $http, $rootScope) {

    $scope.auctions = [];

    get_trending();

    if (logged_in()) {
        get_watches();
    }
    

    function get_trending() {
        var path = PATH_TO_API + "hashtagories/trending/";
        $http.get(path).then(function(data){
             $scope.trends = data.data;
        }, function(data) { requestFailureFunction(data); });        
        
    }
   
    function get_watches() {
        
        $http.get(PATH_TO_API + 'watches/user_watches/?watch_user_id=' + sessionStorage.getItem('user_id') + '&access_token=' + sessionStorage.getItem('access_token') ).then(function(data){
            //alert(JSON.stringify(data));
            $scope.auctions = data.data;

        }, function(data) { requestFailureFunction(data) });
    }    
}]);