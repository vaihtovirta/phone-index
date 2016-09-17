module GsmArena
  class ListItem
    include Concord.new(:node)
    include Procto.call

    delegate :attr, :css, :children, to: :node

    def call
      {
        description: description,
        image_url: image_url,
        title: title,
        id: attr("href").split(".php").first,
        source: "gsm_arena"
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
