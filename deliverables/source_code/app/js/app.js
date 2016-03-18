'use strict';

// Declare app level module which depends on views, and components
angular.module('myApp', [
  
  'ngProgress',
  
  'services.http',
  
  // Directives
  'angucomplete-alt',
  'angularUtils.directives.dirPagination',
  'directives.inputPopup',
  'directives.hashPopup',
  'directives.timeDifference',
  
  // Controllers
  'controllers.feed',
  'controllers.bids',
  'controllers.following',
  'controllers.search',
  'controllers.navbar',
  'controllers.account',
  'controllers.auction',
  'controllers.feedback',
  'controllers.items',
  
  // Routes
  'routes'
  
]);

function alert(str) {
    //console.log(str);
    
    $('#alert_message').html(str);
    $('#alert').modal('show');
} 

function logged_in(set) {
    if (set === undefined) {
        return JSON.parse(sessionStorage.getItem('logged_in'));
    }
} 

function requestFailureFunction(data) {
    
    
    alert("ERROR: " + JSON.stringify(data));
} 