angular.module "phoneIndex"
  .factory "RestangularX",
    (Restangular) ->
      "ngInject"

      (route, parent) ->
        service = Restangular.service(route, parent)

        service.new = (object) ->
          Restangular.restangularizeElement(null, object || {}, route)

        service
