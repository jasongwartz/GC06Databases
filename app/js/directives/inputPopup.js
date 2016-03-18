angular.module('directives.inputPopup', [])

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
        templateUrl: 'templates/input_popup.html',
        link: function (scope) {
            
            for (var i=0; i<scope.inputs.length; i++) {
                if (scope.inputs[i].validation) 
                    scope.inputs[i].validation.count = scope.inputs[i].validation.limit;
            }
            
            scope.charCount = function(index) {
                
                if (scope.inputs[index].validation) {
                    console.log(scope.inputs[index].ngModel.length);

                    var charsLeft = scope.inputs[index].validation.limit - scope.inputs[index].ngModel.length;
    //                if (charsLeft >= 0)
                    scope.inputs[index].validation.count = charsLeft;
                    
                    if (charsLeft === 0) {
                        alert("Maximum of " +  scope.inputs[index].validation.limit +" characters!");
                        scope.inputs[index].validation.count = 0;
                    }
                }
                    
            };
//            scope.name = inputs;
        }
    };
});