angular.module "phoneIndex.modules.main"
  .config ($stateProvider) ->
    "ngInject"

    $stateProvider
      .state "main",
        url: "/"
        templateUrl: "main/index.html"
        controller: "MainController"
        controllerAs: "main"
