module Api
  module Search
    class ProductsController < ApplicationController
      def index
        result = Products::Search.call(query: params[:query])

        respond_with result.products
      end
    end
  end
end
