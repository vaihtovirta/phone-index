class GsmArenaClient
  attr_reader :device_url, :http_client, :query, :search_url
  private :device_url, :http_client, :query, :search_url

  delegate :get, to: :http_client
  delegate :resolve, to: :Container

  def initialize(query)
    @query = query
    @http_client = resolve(:http_client)
    @device_url = resolve("external_apis.gsm_arena.device_url")
    @search_url = resolve("external_apis.gsm_arena.search_url")
  end

  def show
    get("#{device_url}/#{query}.php").to_s
  end

  def search
    get(search_url, params: { sName: query }).to_s
  end
end
