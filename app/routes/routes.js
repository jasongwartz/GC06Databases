angular.module('routes', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/account', {
    templateUrl: 'views/account.html',
    controller: 'accountCtrl'
  });
}])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/auction', {
    templateUrl: 'views/auction.html',
    controller: 'auctionCtrl'
  });
}])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/feed', {
    templateUrl: 'views/feed.html',
    controller: 'feedCtrl'
  });
}])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/feedback', {
    templateUrl: 'views/feedback.html',
    controller: 'feedbackCtrl'
  });
}])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/items', {
    templateUrl: 'views/items.html',
    controller: 'itemsCtrl'
  });
}])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/login', {
    templateUrl: 'views/login.html',
    controller: 'loginCtrl'
  });
}])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.otherwise({redirectTo: '/feed'});
}]);
