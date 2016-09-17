module Products
  class Show
    include Interactor

    delegate :id, :source, to: :context

    before do
      context.source ||= "gsm_arena"
    end

    def call
      context.product = ::SourceManager.call(source, id, "show")
    end
  end
end
