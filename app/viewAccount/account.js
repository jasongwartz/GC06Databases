'use strict';

angular.module('myApp.account', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/account', {
    templateUrl: 'viewAccount/account.html',
    controller: 'AccountCtrl'
  });
}])

.controller('AccountCtrl', ['$scope', '$http', function($scope, $http) {

    $scope.detailsPopupTitle = "Edit Personal Details";
    $scope.detailsInputs = [
        {
            label: "Firstname",
            type: "text"
        },
        {
            label: "Lastname",
            type: "text"
        }
    ];
    $scope.detailsSubmitName = "Make changes";
    $scope.detailsSubmitForm = function() {
        alert("Submitting form! " + $scope.detailsInputs[0].ngModel);
    };
    
    $scope.detailsSetupFn = function() {
//        alert("asasdasd " + $scope.user.first_name);
        $scope.detailsInputs[0].ngModel = $scope.user.first_name; 
        $scope.detailsInputs[1].ngModel = $scope.user.last_name; 
        
    };
    
    $scope.passPopupTitle = "Change Password";
    $scope.passInputs = [
        {
            label: "Password",
            type: "password"
        },
        {
            label: "New password",
            type: "password"
        },
        {
            label: "New password confirmation",
            type: "password"
        }
    ];
    $scope.passSubmitName = "Change Password";
    $scope.passSubmitForm = function() {
        alert("Changing pass! " );
    };

    if (logged_in()) {


//    alert(sessionStorage.getItem('user_id'))
        $http.get(PATH_TO_API + 'users?user_id='+ sessionStorage.getItem('user_id') +'&access_token=' + sessionStorage.getItem('access_token') ).then(function(data){

            $scope.user = data.data[0];
        
        }, function(data) { requestFailureFunction(data); });


    }
    
}]);