angular.module('directives', [])

.directive('inputPopup', function() {
    return {
        restrict: 'E',
        transclude: true,
        scope: {
            submitName: '=', 
            submitFn: '&',
            
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
});