module GsmArena
  class ListPage < BasePage
    include Procto.call

    DEVICE_LIST_CSS = "#review-body li a".freeze

    def call
      device_list.map { |node| GsmArena::ListItem.call(node) }
    end

    private

    def device_list
      @device_list ||= css(DEVICE_LIST_CSS)
    end
  end
end
