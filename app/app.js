'use strict';

function logged_in(set) {
    if (set === undefined) {
        return JSON.parse(sessionStorage.getItem('logged_in'));
    }
} 

function requestFailureFunction(data) {
    
    
    alert(JSON.stringify(data));
} 

// Declare app level module which depends on views, and components
angular.module('myApp', [
  'ngRoute',
  'directives',
  'myApp.feed',
  'myApp.navbar',
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
