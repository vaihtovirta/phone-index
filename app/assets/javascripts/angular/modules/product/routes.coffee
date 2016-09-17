angular.module "phoneIndex.modules.product"
  .config ($stateProvider) ->
    "ngInject"

    $stateProvider
      .state "product",
        url: "/products/:productId"
        templateUrl: "products/show.html"
        controller: "ProductController"
        controllerAs: "vm"
