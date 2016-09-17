class SourceManager
  include Concord.new(:source, :query, :page)
  include Procto.call

  def call
    page_class&.call(raw_html)
  end

  private

  def namespace
    source.classify
  end

  def page_class
    "#{namespace}::#{page.classify}Page".safe_constantize
  end

  def raw_html
    "#{namespace}::Client"
      .safe_constantize
      &.new(query)
      .send(page)
  end
end
