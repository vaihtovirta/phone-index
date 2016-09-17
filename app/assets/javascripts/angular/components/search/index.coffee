SearchController = (Search, $state) ->
  "ngInject"
  ctrl = this

  search = ->
    Search.products.getList(query: ctrl.query).then (products) ->
      ctrl.products = products

  ctrl.search = search

  return

angular.module "phoneIndex"
  .component "piSearch", {
    templateUrl: "components/search/index.html"
    controller: SearchController
  }
