module Products
  class Search
    include Interactor

    SOURCES = %w(gsm_arena)

    delegate :products, :sources, :query, to: :context

    before do
      context.sources ||= SOURCES
      context.products = []
    end

    def call
      return if query.blank?

      context.products = sources.map do |source|
        ::SourceManager.call(source, query, "search")
      end.flatten
    end
  end
end
