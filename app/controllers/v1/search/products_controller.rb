module V1
  module Search
    class ProductsController < ApiApplicationController
      def index
        result = Products::Search.call(query: params[:query])

        respond_with result.products
      end
    end
  end
end
