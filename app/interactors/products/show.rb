module Products
  class Show
    include Interactor

    delegate :link, :page, to: :context
    delegate :battery,
      :brief,
      :camera,
      :display,
      :expansion,
      :image,
      :title,
      to: :page

    before do
      context.page ||= GsmArena::ItemPage.new(raw_html)
    end

    def call
      build_product
    end

    private

    def build_product
      context.product = {
        battery: battery,
        brief: brief,
        camera: camera,
        display: display,
        expansion: expansion,
        image: image,
        title: title
      }.to_json
    end

    def raw_html
      ExternalApi::GsmArena.new(link).find
    end
  end
end
