angular.module "phoneIndex.resources"
  .factory "Products",
    (RestangularX) ->
      "ngInject"
      RestangularX("products")
