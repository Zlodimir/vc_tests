angular.module('vc_tests').factory 'Feedback', ['$resource', ($resource) ->
  $resource '/api/feedbacks/:id.json'
]
