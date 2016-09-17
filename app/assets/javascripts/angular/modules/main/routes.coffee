angular.module "phoneIndex.modules.main"
  .config ($stateProvider) ->
    "ngInject"

    $stateProvider
      .state "home",
        url: "/"
        templateUrl: "main/index.html"
        controller: "MainController"
        controllerAs: "main"
