module Products
  class Search
    include Interactor

    delegate :products, :query, to: :context

    def call
      context.products ||= GsmArena::ListPage.call(raw_html)
    end

    private

    def raw_html
      ExternalApi::GsmArena.call(query)
    end
  end
end
