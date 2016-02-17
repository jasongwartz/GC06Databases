angular.module('myApp.navbar', ['ngRoute'])

.controller('navbarCtrl', ['$rootScope', '$http', function($rootScope, $http) {

    $rootScope.logged_in = logged_in();

    $rootScope.reg_submitName = "Time to register!";
    $rootScope.reg_popupTitle = "Register now!";
    $rootScope.reg_inputs = [
        {
            label: "Username",
            type: "text"
        },
        {
            label: "Email",
            type: "text"
        },
        {
            label: "Password",
            type: "password"
        },
        {
            label: "Confirm Password",
            type: "password"
        }
    ];
    
    $rootScope.register = function() {
        
        alert("registering");
    };

    $rootScope.submitName = "Log in!";
    $rootScope.popupTitle = "Enter Login Details!";
    $rootScope.inputs = [
        {
            label: "Username",
            type: "text"
        },
        {
            label: "Password",
            type: "password"
        }
    ];

    $rootScope.root_user_id = sessionStorage.getItem('user_id');

    $rootScope.log_in = function() {

        var post_data = $.param({
            username: $rootScope.inputs[0].ngModel,
            password: $rootScope.inputs[1].ngModel
        });

        var url = PATH_TO_API + 'authenticate/';
        //alert(post_data + " to " + url);
        $http({
            method: 'POST',
            url: url,
            data: post_data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).then(function(data){

            $rootScope.logged_in = true;

//            alert(data.data + ' ' + $rootScope.logged_in);
            
            sessionStorage.setItem('logged_in', JSON.stringify(true));
            
            sessionStorage.setItem('access_token', data.data.access_token);
            sessionStorage.setItem('user_id', JSON.stringify(data.data.user_id));
            
            $rootScope.root_user_id = data.data.user_id;

        }, function(data) { requestFailureFunction(data); });
        
//        $http.get(PATH_TO_API + 'authenticate/').then(function(data){
//
//            $rootScope.logged_in = true;
//
////            alert(data.data + ' ' + $rootScope.logged_in);
//            
//            sessionStorage.setItem('logged_in', JSON.stringify(true));
//            
//            sessionStorage.setItem('access_token', data.data.access_token);
//            sessionStorage.setItem('user_id', JSON.stringify(data.data.user_id));
//            
//            $rootScope.root_user_id = data.data.user_id;
//            
////            window.location.href = '#/feed';
//        
//        }, function(data) { requestFailureFunction(data); });
        
    };

    $rootScope.log_out = function() {
        
        $rootScope.logged_in = false;
        
        sessionStorage.setItem('logged_in', JSON.stringify(false));
        sessionStorage.removeItem('user_id');
        sessionStorage.removeItem('access_token');

        $rootScope.root_user_id = -1;
        
        window.location.reload();
        
        $('.open').removeClass('open');

    };
    
    $rootScope.watchlist_filter = function() {
        
        alert('Watchlist filtering');
        
    };
 
    $rootScope.search_filter = function() {
        
        alert('Search filtering');
        
    };
    
}]);