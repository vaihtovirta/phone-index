module Products
  class Search
    include Interactor

    delegate :products, :query, to: :context

    before do
      context.products = []
    end

    def call
      return if query.blank?

      context.products = GsmArena::ListPage.call(raw_html)
    end

    private

    def raw_html
      ExternalApi::GsmArena.call(query)
    end
  end
end
