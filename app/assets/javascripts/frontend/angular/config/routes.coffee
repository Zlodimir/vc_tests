angular.module('vc_tests').config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise '/'

    $stateProvider
      .state('landing',
        url: '/'
        controller: 'LandingController'
        templateUrl: 'landing.html')
      .state('feedback',
        url: '/feedback'
        controller: 'FeedbackController'
        templateUrl: 'feedback.html')
]
