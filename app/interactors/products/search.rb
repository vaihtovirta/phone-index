module Products
  class Search
    include Interactor

    SOURCES = %w(gsm_arena).freeze

    delegate :products, :sources, :query, to: :context

    before do
      context.sources ||= SOURCES
      context.products = []
    end

    def call
      return if query.blank?

      context.products = sources.flat_map { |source| SourceManager.call(source, query, "search") }
    end
  end
end
