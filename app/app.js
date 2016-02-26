'use strict';

function logged_in(set) {
    if (set === undefined) {
        return JSON.parse(sessionStorage.getItem('logged_in'));
    }
} 

function requestFailureFunction(data) {
    
    
    alert("ERROR: " + JSON.stringify(data));
} 

// Declare app level module which depends on views, and components
angular.module('myApp', [
    'angularUtils.directives.dirPagination',
  'ngRoute',
  'directives',
  'myApp.feed',
  'myApp.navbar',
  'myApp.account',
  'myApp.auction',
  'myApp.feedback',
  'myApp.items',
  'myApp.version'
]).
config(['$routeProvider', function($routeProvider) {
  $routeProvider.otherwise({redirectTo: '/feed'});
}]);
