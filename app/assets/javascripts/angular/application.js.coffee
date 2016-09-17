"use strict"

angular.module("phoneIndex", [
  "ng-rails-csrf",
  "ui.router",
  "ngLodash",
  "restangular",
  "templates",

  "phoneIndex.resources",

  "phoneIndex.modules.main"
]).config ($urlRouterProvider) ->
  "ngInject"

  $urlRouterProvider.otherwise "/"
