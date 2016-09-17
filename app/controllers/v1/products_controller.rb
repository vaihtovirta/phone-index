module V1
  class ProductsController < ApiApplicationController
    def show
      result = Products::Show.call(id: params[:id])

      respond_with result.product
    end
  end
end
