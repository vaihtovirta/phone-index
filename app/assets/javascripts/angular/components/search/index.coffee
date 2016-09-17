SearchController = (Search) ->
  "ngInject"
  ctrl = this

  find = ->
    Search.products.getList(query: ctrl.query).then (products) ->
      ctrl.products = products

  ctrl.find = find

  return

angular.module "phoneIndex"
  .component "piSearch", {
    templateUrl: "components/search/index.html"
    controller: SearchController
  }
