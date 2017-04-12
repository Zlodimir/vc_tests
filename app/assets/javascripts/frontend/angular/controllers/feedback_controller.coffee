FeedbackController = ($scope, Feedback) ->
  $scope.saveFeedback = (feedback) ->
    Feedback.save { feedback: feedback }, (data) ->
      $scope.showSuccessAlert = true
      $scope.feedback = { email: '', text: ''}
    , (errdata) ->
      $scope.showErrorAlert = true

  $scope.switchBool = (value) ->
    $scope[value] = !$scope[value]

FeedbackController.$inject = ['$scope', 'Feedback']
angular.module('vc_tests').controller 'FeedbackController', FeedbackController
