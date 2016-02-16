angular.module('directives', [])

.directive('inputPopup', function() {
    return {
        restrict: 'E',
        transclude: true,
        scope: {
            popupId: '@',
            
            submitName: '=', 
            submitFn: '&',
            
            setupFn: '&',
            
            title: '=',
            
            inputs: '=',
            
            btnClass: '@'
        },
//        scope: {
//            submitFn: '&',
//            btnadd: '@',
//            btncancel: '@',
//            btnsubmit: '@',            
//            inputs: '=',
//            inputclass: '@',
//            labelclass: '@',
//            btnclass: '@'
//        },
        templateUrl: 'directives/input_popup.html',
        link: function (scope) {
            
//            scope.name = inputs;
        }
    };
})
.directive('hashPopup', function() {
    return {
        restrict: 'E',
        transclude: true,
        scope: {
            popupId: '@',
            
            submitName: '=', 
            submitFn: '&',
            
            setupFn: '&',
            
            title: '=',
            
            inputs: '='
        },
        templateUrl: 'directives/hash_popup.html',
        link: function (scope) {
            
//            scope.name = inputs;
        }
    };
})
.directive('timeDifference', ['$interval', 'dateFilter', function($interval, dateFilter) {

  function link(scope, element, attrs) {
    var format  = "H 'hours', m 'minutes', s 'seconds'",
        timeoutId;

    function updateTime() {
        var dateDifference = (new Date(scope.date)-(new Date()));
        
        var dayDifference = parseInt(dateDifference/(24*3600000));
        
        element.text( dayDifference +  " days, "  
                + dateFilter(dateDifference, format));
    }

//    scope.$watch(attrs.myCurrentTime, function(value) {
////      format;
//      updateTime();
//    });

    element.on('$destroy', function() {
      $interval.cancel(timeoutId);
    });

    // start the UI update process; save the timeoutId for canceling
    timeoutId = $interval(function() {
      updateTime(); // update DOM
    }, 1000);
  }

  return {
      restrict: 'E',
    link: link,
    scope: {
        date: '='
    }
  };
}]);