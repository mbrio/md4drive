angular.module('md4drive', [])
  .config ($routeProvider) ->
    $routeProvider
      .when('/',
        controller: MarkdownController
        templateUrl: 'editor.html')
      .otherwise(redirectTo: '/')

MarkdownController = ($rootScope, $scope, $http) ->
  $scope.test = 'test me out'