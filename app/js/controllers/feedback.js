'use strict';

angular.module('controllers.feedback', [])

.controller('feedbackCtrl', ['$scope', '$http', function($scope, $http) {

    if (logged_in()) {

//    alert(sessionStorage.getItem('user_id'))
        $http.get(PATH_TO_API + 'users?user_id='+ sessionStorage.getItem('user_id') +'&access_token=' + sessionStorage.getItem('access_token') ).then(function(data){

            $scope.user = data.data[0];
        
        }, function(data) { requestFailureFunction(data); });


    }

    
}]);