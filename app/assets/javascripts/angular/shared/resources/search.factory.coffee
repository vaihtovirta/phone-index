angular.module "phoneIndex.resources"
  .factory "Search",
    (RestangularX) ->
      "ngInject"

      Search = {}

      Search.products = RestangularX("search/products")

      Search
