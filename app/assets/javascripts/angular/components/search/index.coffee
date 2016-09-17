SearchController = (Products)->
  "ngInject"
  ctrl = this

  find = ->
    Products.getList(query: ctrl.query).then (products) ->
      console.log products

  ctrl.find = find

  return

angular.module "phoneIndex"
  .component "piSearch", {
    templateUrl: "components/search/index.html"
    controller: SearchController
  }
