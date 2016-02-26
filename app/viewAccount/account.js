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
            label: "First name",
            type: "text"
        },
        {
            label: "Last name",
            type: "text"
        },
        {
            label: "Email",
            type: "text"
        }
    ];
    $scope.detailsSubmitName = "Make changes";
    $scope.detailsSubmitForm = function() {
        
        var post_data = $.param({
            user_id: sessionStorage.getItem("user_id"),
            first_name: $scope.detailsInputs[0].ngModel,
            last_name: $scope.detailsInputs[1].ngModel,
            email: $scope.detailsInputs[2].ngModel
        });

        var url = PATH_TO_API + 'users/update/';
        //alert(post_data + " to " + url);
        $http({
            method: 'POST',
            url: url,
            data: post_data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).then(function(data){

            alert("User info updated!");

        }, function(data) { requestFailureFunction(data); });
        
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