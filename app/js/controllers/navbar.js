angular.module('controllers.navbar', [])

.controller('navbarCtrl', ['$rootScope', '$http', '$location', '$route', '$scope', function($rootScope, $http, $location, $route, $scope) {

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
        
        var password = $rootScope.reg_inputs[4].ngModel
        
        if (password.toLowerCase()!=password && password.toUpperCase()!=password && password.match(/\d+/g)!=null && password.length>=8){
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
            
        }
        else{
            alert("Please ensure that your password contains 1 lower case, 1 capital, 1 numeric and is at least 8 characters long")
        }
        
        
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

            if (!data.data.error) { 
                $rootScope.logged_in = true;

                sessionStorage.setItem('logged_in', JSON.stringify(true));

                sessionStorage.setItem('access_token', data.data.access_token);
                sessionStorage.setItem('user_id', JSON.stringify(data.data.user_id));

                $rootScope.root_user_id = data.data.user_id;
            
            } else {
                var str = "";
                
                for (var i=0; i<data.data.error.length; i++) {
                    str += data.data.error[i];
                }
                
                alert(str);
            }
            //alert( sessionStorage.getItem('user_id') );

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
    
    $rootScope.home_feed = function() {
        $rootScope.filter = "HOME";
        $location.path("/feed").search({});
    };
    
    $rootScope.watchlist_filter = function() {
      
        //alert('Watchlist filtering');
        
        get_watches();
        
        $rootScope.filter = "WATCH";
        $location.path("/following").search({});

    };
    
    $scope.hashtagories = [];
    get_hashtagories_list();
    
    function get_hashtagories_list() {
        $http.get(PATH_TO_API + "hashtagories/all/" ).then(function(data){

            $scope.hashtagories = data.data;
        
        }, function(data) { requestFailureFunction(data); });
    }
    
    function get_params() {
        var url = window.location.href;
        if (url.indexOf("?") > -1) {
            var qs = window.location.href.split('?')[1];

            qs = qs.split('+').join(' ');

            var params = {},
                tokens,
                re = /[?&]?([^=]+)=([^&]*)/g;

            while (tokens = re.exec(qs)) {
                params[decodeURIComponent(tokens[1])] = decodeURIComponent(tokens[2]);
            }

            return params;
        } else {
            return undefined;
        }
    }
    // Search functionality
    $rootScope.search_filter = function(selected) {
        //alert(JSON.stringify(selected));
        
        if (selected !== undefined && selected.title !== undefined) {
            if (selected.title.length > 0) {
                //window.alert('You have selected ' + selected.title);
                var params = get_params();
                
                //alert(params.query);(params ? params.query + " " : "") + 
                $rootScope.filter = "SEARCH";
                $location.path("/search").search({query: selected.title});
            } else {
                console.log('cleared');
                $rootScope.filter = "HOME";
                $location.path("/feed").search({});
            }
        }
    }; 
    $rootScope.sort = "";
    $rootScope.sortFn = function(str) {

        var search = $location.search().query;

        var params = {};

        switch(str) {
            case 'start_time':
                params = {query: search, sort_order: 1, sort: 'start_time'};
               
                break; 
            case 'end_time':
                params = {query: search, sort_order: 1, sort: 'end_time'};
                break;
            case 'most_viewed':
                params = {query: search, sort_order: 1, sort: 'views'};
                break;
            case 'title':
                params = {query: search, sort_order: 1, sort: 'title'};
                break;            
        }
        
//         document.getElementById(str).checked = false;
        
        $location.path("/search").search(params);
        
//        document.getElementById(str).checked = true;
    };
    
    
    
    
    if (logged_in()) {
        
        get_watches();
             
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
                //alert(JSON.stringify(data));
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
    
    function get_watches() {
        //alert("getting watches");
        $http.get(PATH_TO_API + 'watches/user_watches/?watch_user_id=' + sessionStorage.getItem('user_id') + '&access_token=' + sessionStorage.getItem('access_token') ).then(function(data){

            //alert(JSON.stringify(data));

            $rootScope.watches = data.data;

            var auction_id = window.location.href.split('auction?')[1];
            if (auction_id !== undefined) {
                $rootScope.isInWatches = isInWatches(auction_id);
                alert($rootScope.isInWatches + " " + auction_id);
            }


        }, function() { 
            $rootScope.log_out(); 
        });
    }    
}]);