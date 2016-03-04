'use strict';

angular.module('controllers.profile', [])

.controller('profileCtrl', ['$scope', '$http', function($scope, $http, $routeParams) {

    $scope.user_id = $routeParams.user_id
    
    function get_feedbacks(){
        $http.get(PATH_TO_API + 'feedback/for_user?user_id='+ $scope.user_id ).then(function(data){

            $scope.feedback_group = data;
        
        }, function(data) { requestFailureFunction(data); });
    }
    
}]);
