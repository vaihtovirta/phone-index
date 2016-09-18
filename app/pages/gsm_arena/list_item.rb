module GsmArena
  class ListItem
    include Concord.new(:node)
    include Procto.call

    delegate :attr, :css, :children, to: :node

    def call
      {
        description: description,
        id: attr("href").split(".php").first,
        image_url: image_url,
        source: "gsm_arena",
        title: title
      }
    end

    private

    def description
      children.attr("title").value
    end

    def image_url
      children.attr("src").value
    end

    def title
      css("br").each { |node| node.replace(" ") }

      node.text
    end
  end
end
