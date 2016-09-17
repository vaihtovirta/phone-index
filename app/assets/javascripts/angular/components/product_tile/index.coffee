ProductTileController = ->
  "ngInject"
  ctrl = this

  return

angular.module "phoneIndex"
  .component "piProductTile", {
    templateUrl: "components/product_tile/index.html"
    controller: ProductTileController
    bindings:
      product: "="
  }
