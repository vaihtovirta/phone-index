angular.module "phoneIndex"
  .config (RestangularProvider, API_HOST, DEFAULT_HEADERS) ->
    "ngInject"

    RestangularProvider.setBaseUrl(API_HOST)
    RestangularProvider.setDefaultHeaders(DEFAULT_HEADERS)
