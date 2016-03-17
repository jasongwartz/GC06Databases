angular.module('services.http', []).
factory('http', ['$rootScope', '$http', '$q', 'ngProgressFactory', function($rootScope, $http, $q, ngProgressFactory) {

    $rootScope.progressbar = ngProgressFactory.createInstance();
    $rootScope.progressbar.setColor('#1b95e0');
    $rootScope.progressbar.start();
//    setTimeout(function() {$rootScope.progressbar.complete();}, 2000);

    var totalCount = 0;
    var returnCount = 0;
    
    var http = function(config) {
        totalCount++;
        console.log("post " + totalCount);
        return $q(function(resolve, reject) {
            $http(config).then(function(data){
                returnCount++;
                console.log(returnCount + "/" + totalCount);
                resolve(data);

                if (totalCount === returnCount) {
                    $rootScope.progressbar.complete();
                }

            }, function(data) { 
                reject(data); 
            });   
        });   
        
        
    };
    http.get = function(path) {
        totalCount++;
        console.log("get " + totalCount);
        return $q(function(resolve, reject) {
            $http.get(path).then(function(data){
                returnCount++;
                console.log(returnCount + "/" + totalCount);
                resolve(data);

                if (totalCount === returnCount) {
                    $rootScope.progressbar.complete();
                }

            }, function(data) { 
                reject(data); 
            });   
        });          
    };
    
    
    return http;
       
      
   
   
}]);

