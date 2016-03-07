'use strict';

angular.module('controllers.feed', [])

.controller('feedCtrl', ['$scope', '$http', '$rootScope', '$routeParams', function($scope, $http, $rootScope, $routeParams) {

    
    //$scope.selectedCountry = {};
    $scope.selectedCountry = function(selected) {
        if (selected) {
          window.alert('You have selected ' + selected.title);
        } else {
          console.log('cleared');
        }
    };
    

    $scope.auctions = [];

    get_trending();

    function get_trending() {
        var path = PATH_TO_API + "hashtagories/trending/";
        $http.get(path).then(function(data){
             $scope.trends = data.data;
        }, function(data) { requestFailureFunction(data); });        
        
    }
    
    console.log($rootScope.filter);
    
    
    switch($rootScope.filter) { 

        case "SEARCH":
            var path_with_params = PATH_TO_API + 'auctions/search?query='+encodeURIComponent($routeParams['query']);
            $http.get(path_with_params).then(function(data){
                 $scope.auctions = data.data
            }, function(data) { requestFailureFunction(data); });
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