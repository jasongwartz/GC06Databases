'use strict';

angular.module('controllers.user', [])

.controller('userCtrl', ['$scope', '$http', '$rootScope', function($scope, $http, $rootScope) {

    var user_id = window.location.href.split('?')[1];
    
    get_user_data();


    function get_user_feedback() {

        $http.get(PATH_TO_API + 'feedback/for_user/?user_id='+ user_id +'&access_token=' + sessionStorage.getItem('access_token') ).then(function(data){

            $scope.user = data.data[0];
        
        }, function(data) { requestFailureFunction(data); });
        
    }

    function get_user_data() {
        $http.get(PATH_TO_API + 'users?user_id='+ user_id +'&access_token=' + sessionStorage.getItem('access_token') ).then(function(data){

            $scope.user = data.data[0];
        
        }, function(data) { requestFailureFunction(data); });
    }        
}]);