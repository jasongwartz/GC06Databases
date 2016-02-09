angular.module('myApp.navbar', ['ngRoute'])

.controller('navbarCtrl', ['$rootScope', function($rootScope) {

    $rootScope.logged_in = logged_in();

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