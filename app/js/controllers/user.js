'use strict';

angular.module('controllers.user', [])

.controller('userCtrl', ['$scope', '$http', '$rootScope', function($scope, $http, $rootScope) {

    
    var user_id = parseInt(window.location.href.split('?')[1]);
    
    get_username(user_id);
    get_user_feedback(user_id);

    $scope.edit_submitName = "Make edit!";
    $scope.edit_popupTitle = "Edit your feeback!";
    $scope.edit_inputs = [];    

    $scope.current_user_id = parseInt(sessionStorage.getItem('user_id'));
    $scope.user_id = user_id;

    $scope.setup_edit = function(feedback, buyerOrSeller) {

        $scope.edit_inputs = [
            {
                label: "Feedback",
                type: "textarea",
                ngModel: feedback[buyerOrSeller + "text"]
            },
            {
                label: "Rating",
                type: "range",
                ngModel: feedback[buyerOrSeller + "rating"]
            }
        ];            
    };
    $scope.edit_feedback = function(feedback) {
        //alert(item.item_id + " " + $scope.edit_inputs[0].ngModel + " " + $scope.edit_inputs[1].ngModel);
        //alert($scope.edit_inputs[0].ngModel );
        
        var post_data = $.param({

                user_id: sessionStorage.getItem('user_id'),
                feedback_auction_id: feedback.feedback_auction_id,
                feedback_text: $scope.edit_inputs[0].ngModel ,
                feedback_rating: $scope.edit_inputs[1].ngModel     

            });

            //alert($scope.edit_inputs[1].ngModel);

        var url = PATH_TO_API + 'feedback/update/?access_token=' + sessionStorage.getItem('access_token');
//        alert(post_data + " to " + url);
        $http({
            method: 'POST',
            url: url,
            data: post_data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).then(function(data){
//                alert(JSON.stringify(data))
            alert("Edit made!"); //Needs to be here...
            get_user_feedback(user_id);

        }, function(data) { requestFailureFunction(data); });
    };        

    function get_user_feedback(user_id) {

        $http.get(PATH_TO_API + 'feedback/for_user/?user_id='+ user_id ).then(function(data){

            alert(JSON.stringify(data))
            $scope.feedbacks = data.data;
        
        }, function(data) { requestFailureFunction(data); });
        
    }

    function get_username(user_id) {
        $http.get(PATH_TO_API + 'users/username/?user_id='+ user_id).then(function(data){

            $scope.username = data.data[0].username;
        
        }, function(data) { requestFailureFunction(data); });
    }        
}]);