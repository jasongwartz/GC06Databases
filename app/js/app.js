'use strict';

// Declare app level module which depends on views, and components
angular.module('myApp', [
  
  // Directives
  'angularUtils.directives.dirPagination',
  'directives.inputPopup',
  'directives.hashPopup',
  'directives.timeDifference',
  
  // Controllers
  'controllers.feed',
  'controllers.navbar',
  'controllers.account',
  'controllers.auction',
  'controllers.feedback',
  'controllers.items',
  'controllers.user',
  
  // Routes
  'routes'
  
]);

function logged_in(set) {
    if (set === undefined) {
        return JSON.parse(sessionStorage.getItem('logged_in'));
    }
} 

function requestFailureFunction(data) {
    
    
    alert("ERROR: " + JSON.stringify(data));
} 