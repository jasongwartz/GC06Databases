'use strict';

// Declare app level module which depends on views, and components
angular.module('myApp', [
   
  'ngRoute',
  
  // Directives
  'angularUtils.directives.dirPagination',
  'directive.inputPopup',
  'directive.hashPopup',
  'directive.timeDifference',
  
  // Controllers
  'controller.feed',
  'controller.navbar',
  'controller.account',
  'controller.auction',
  'controller.feedback',
  'controller.items',
  
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