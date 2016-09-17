angular.module "phoneIndex"
  .config ($locationProvider) ->
    "ngInject"

    $locationProvider.html5Mode(true)
