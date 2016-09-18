module GsmArena
  class ShowPage < BasePage
    include Procto.call

    TEXT_ATTRIBUTES = %i(battery camera display expansion).freeze

    TEXT_ATTRIBUTES.each do |attribute|
      define_method attribute do
        css(".help-#{attribute}")
          .text
          .split("\r\n")
          .map(&:squish)
          .reject(&:empty?)
          .join(" ")
      end
    end

    def call
      {
        battery: battery,
        brief: brief,
        camera: camera,
        display: display,
        expansion: expansion,
        image: image,
        title: title
      }
    end

    private

    def brief
      css(".specs-brief span")
        .map(&:text)
        .reject(&:empty?)
        .join(" ")
    end

    def image
      css(".specs-photo-main img").attr("src").value
    end

    def title
      css(".specs-phone-name-title").text
    end
  end
end
