module GsmArena
  class ItemPage < BasePage
    TEXT_ATTRIBUTES = %i(battery camera display expansion).freeze

    TEXT_ATTRIBUTES.each do |attribute|
      define_method attribute do
        css(".help-#{attribute}")
          .text
          .split("\r\n")
          .map(&:squish)
          .reject(&:empty?)
      end
    end

    def brief
      css(".specs-brief span").map(&:text).reject(&:empty?)
    end

    def image
      css(".specs-photo-main img").attr("src").value
    end

    def title
      css(".specs-phone-name-title").text
    end
  end
end
