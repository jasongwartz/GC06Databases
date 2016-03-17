'use strict';

angular.module('controllers.account', [])

.controller('accountCtrl', ['$scope', '$http', '$rootScope', function($scope, $http, $rootScope) {

    $rootScope.progressbar.start();
    setTimeout(function() {$rootScope.progressbar.complete();}, 2000);
    
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

        //alert(post_data);
        var url = PATH_TO_API + 'users/update/?access_token=' + sessionStorage.getItem('access_token');
        //alert(post_data + " to " + url);
        $http({
            method: 'POST',
            url: url,
            data: post_data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).then(function(data){

            //alert(JSON.stringify(data));
            if (data.data.error === undefined) {

                get_user_data();

                alert("User info updated!");
            } else {
                var errStr = "";
                for (var i=0; i<data.data.error.length; i++) {
                    
                    errStr += data.data.error[i] + "\n";
                }
                alert(errStr);
            }

        }, function(data) { requestFailureFunction(data); });
        
        //alert("Submitting form! " + $scope.detailsInputs[0].ngModel);
    };
    
    $scope.detailsSetupFn = function() {
//        alert("asasdasd " + $scope.user.first_name);
        $scope.detailsInputs[0].ngModel = $scope.user.first_name; 
        $scope.detailsInputs[1].ngModel = $scope.user.last_name; 
        $scope.detailsInputs[2].ngModel = $scope.user.email; 
        
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
        alert($scope.passInputs[1].ngModel + " " + $scope.passInputs[2].ngModel)
        if ($scope.passInputs[1].ngModel !== $scope.passInputs[2].ngModel) {
            alert("Passwords do not match!");
        }
        
        var post_data = $.param({
            user_id: sessionStorage.getItem("user_id"),
            password: $scope.passInputs[0].ngModel,
            new_password: $scope.passInputs[1].ngModel
        });

        alert(post_data);
        var url = PATH_TO_API + 'users/change_password/?access_token=' + sessionStorage.getItem('access_token');
        //alert(post_data + " to " + url);
        $http({
            method: 'POST',
            url: url,
            data: post_data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).then(function(data){

            alert("Password changed!");

        }, function(data) { requestFailureFunction(data); });
        
        alert("Changing pass! " );
    };

    if (logged_in()) {


//    alert(sessionStorage.getItem('user_id'))
        get_user_data();


    }
    
    function get_user_data() {
        $http.get(PATH_TO_API + 'users?user_id='+ sessionStorage.getItem('user_id') +'&access_token=' + sessionStorage.getItem('access_token') ).then(function(data){

            $scope.user = data.data[0];
        
        }, function(data) { requestFailureFunction(data); });
    }
    
}]);