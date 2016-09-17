angular.module "phoneIndex.modules.product"
  .controller "ProductController", (Products, $stateParams)->
    "ngInject"
    vm = this

    getProduct = ->
      Products
      .one($stateParams.productId)
      .get({source: $stateParams.source})
      .then (product) ->
        vm.product = product

    getProduct()

    return
