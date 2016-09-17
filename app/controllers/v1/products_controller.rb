module V1
  class ProductsController < ApiApplicationController
    def show
      id, source = params.values_at(:id, :source)
      result = Products::Show.call(id: id, source: source)

      respond_with result.product
    end
  end
end
