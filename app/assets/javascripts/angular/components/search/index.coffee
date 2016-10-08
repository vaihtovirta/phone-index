SearchController = (Search, $state) ->
  "ngInject"
  ctrl = this

  search = ->
    Search.products.getList(query: ctrl.query).then (products) ->
      ctrl.productGroups = _.chunk products, 4
      ctrl.form.$setPristine() if products?.length


  placeholderText = ->
    { form, productGroups } = ctrl

    if !productGroups?.length && form.$submitted
      "No products found."

  ctrl.search = search
  ctrl.placeholderText = placeholderText

  return

angular.module "phoneIndex"
  .component "piSearch", {
    templateUrl: "components/search/index.html"
    controller: SearchController
  }
