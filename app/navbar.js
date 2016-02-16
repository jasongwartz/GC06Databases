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

    $rootScope.submitName = "Enter Login Details!";
    $rootScope.popupTitle = "Log in!";
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

    $rootScope.log_in = function() {
        
        $http.get(PATH_TO_API + 'auth').then(function(data){

            $rootScope.logged_in = true;

//            alert(data.data + ' ' + $rootScope.logged_in);
            
            sessionStorage.setItem('logged_in', JSON.stringify(true));
            
            sessionStorage.setItem('access_token', data.data.access_token);
            sessionStorage.setItem('user_id', JSON.stringify(data.data.user_id));
            
            $rootScope.root_user_id = data.data.user_id;
            
            window.location.href = '#/feed';
        
        }, function(data) { requestFailureFunction(data); });
        
    };

    $rootScope.log_out = function() {
        
        $rootScope.logged_in = false;
        
        sessionStorage.setItem('logged_in', JSON.stringify(false));
        sessionStorage.removeItem('user_id');
        sessionStorage.removeItem('access_token');
        
        $('.open').removeClass('open');

    };
    
    $rootScope.watchlist_filter = function() {
        
        alert('Watchlist filtering');
        
    };
 
    $rootScope.search_filter = function() {
        
        alert('Search filtering');
        
    };
    
}]);