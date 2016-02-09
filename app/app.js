'use strict';
var PATH_TO_API = '/hashtagories/api/';
// Declare app level module which depends on views, and components
angular.module('myApp', [
  'ngRoute',
  'myApp.feed',
  'myApp.login',
  'myApp.account',
  'myApp.auction',
  'myApp.feedback',
  'myApp.items',
  'myApp.view1',
  'myApp.view2', 
  'myApp.version'
]).
config(['$routeProvider', function($routeProvider) {
  $routeProvider.otherwise({redirectTo: '/feed'});
}]);
