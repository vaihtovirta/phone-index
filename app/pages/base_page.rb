class BasePage
  include Concord.new(:html)

  delegate :css, :at_css, to: :document

  private

  def document
    @document ||= Nokogiri::HTML(html)
  end
end
