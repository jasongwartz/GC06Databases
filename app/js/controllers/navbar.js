angular.module('controllers.navbar', [])

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

        var post_data = $.param({
            username: $rootScope.reg_inputs[0].ngModel,
            first_name: $rootScope.reg_inputs[1].ngModel,
            last_name: $rootScope.reg_inputs[2].ngModel,
            email: $rootScope.reg_inputs[3].ngModel,
            password: $rootScope.reg_inputs[4].ngModel,
            confirm_password: $rootScope.reg_inputs[5].ngModel
        });

        var url = PATH_TO_API + 'users/create/';
        //alert(post_data + " to " + url);
        $http({
            method: 'POST',
            url: url,
            data: post_data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).then(function(data){

            alert("User " + $rootScope.reg_inputs[0].ngModel + " created!");

        }, function(data) { requestFailureFunction(data); });
        
        //alert("registering");
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

        if ($rootScope.inputs[0].ngModel === undefined || $rootScope.inputs[1].ngModel === undefined) {
            alert("Please fill in username and password.");
            return;
        }

        var post_data = $.param({
            username: $rootScope.inputs[0].ngModel,
            password: $rootScope.inputs[1].ngModel
        });

        var url = PATH_TO_API + 'users/authenticate/';
        //alert(post_data + " to " + url);
        $http({
            method: 'POST',
            url: url,
            data: post_data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).then(function(data){

            $rootScope.logged_in = true;
            
            sessionStorage.setItem('logged_in', JSON.stringify(true));
            
            sessionStorage.setItem('access_token', data.data.access_token);
            sessionStorage.setItem('user_id', JSON.stringify(data.data.user_id));
            
            $rootScope.root_user_id = data.data.user_id;
            
            alert( sessionStorage.getItem('user_id') );

        }, function(data) { 
            alert(data.data.error);
        });
        
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
        
              
        $rootScope.filter = "WATCH";
        alert('Watchlist filtering');
        
        get_watches();
        alert(window.location.href.test(/#\/feed/));
        if (window.location.href.test(/#\/feed/))
            window.location.href = "#/feed";
        else 
            window.location.reload();
        
        
        
        
    };
    
    
 
    $rootScope.search_filter = function() {
        
        $rootScope.filter = "SEARCH";
        alert('Search filtering');
        
    };
    
    if (logged_in()) {
        
        get_watches();
        
        function get_watches() {
            $http.get(PATH_TO_API + 'watches/user_watches/?watch_user_id=' + sessionStorage.getItem('user_id') + '&access_token=' + sessionStorage.getItem('access_token') ).then(function(data){

                alert(JSON.stringify(data));
                
                $rootScope.watches = data.data;
                
                var auction_id = window.location.href.split('?')[1];
                if (auction_id !== undefined) {
                    $rootScope.isInWatches = isInWatches(auction_id);
                    alert($rootScope.isInWatches + " " + auction_id);
                }
                

            }, function() { 
                $rootScope.log_out(); 
            });
        }
        
        $rootScope.isInWatches = function(id) {
            //alert("is in watches " + id);
            if (id !== undefined && $rootScope.watches !== undefined) {

                for (var i=0; i<$rootScope.watches.length; i++) {
                    if ($rootScope.watches[i].auction_id === parseInt(id))
                        return true;
                }
                return false;
            }
        }; 
        
        $rootScope.add_to_watchlist = function(auction) {
            var post_data = $.param({
                watch_user_id: sessionStorage.getItem("user_id"),
                watch_auction_id: auction.auction_id
            });

            var url = PATH_TO_API + 'watches/create/?access_token=' + sessionStorage.getItem('access_token');
    //        alert(post_data + " to " + url);
            $http({
                method: 'POST',
                url: url,
                data: post_data,
                headers: {'Content-Type': 'application/x-www-form-urlencoded'}
            }).then(function(data){
                alert(JSON.stringify(data));
                get_watches();

            }, function(data) { requestFailureFunction(data); });        
        };

        $rootScope.remove_from_watchlist = function(auction) {
            var post_data = $.param({
                    watch_user_id: sessionStorage.getItem("user_id"),
                    watch_auction_id: auction.auction_id

                });


            var url = PATH_TO_API + 'watches/delete/?access_token=' + sessionStorage.getItem('access_token');
    //        alert(post_data + " to " + url);
            $http({
                method: 'POST',
                url: url,
                data: post_data,
                headers: {'Content-Type': 'application/x-www-form-urlencoded'}
            }).then(function(data){

                get_watches();

            }, function(data) { requestFailureFunction(data); });   
        };
        
   
        
    }
    
}]);