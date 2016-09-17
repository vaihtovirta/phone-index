module ExternalApi
  class GsmArena
    include Concord.new(:query)

    delegate :resolve, to: Container
    delegate :get, to: :http_client

    def find
      device_page_html
    end

    def search
      search_results_html
    end

    private

    def http_client
      @http_client ||= HTTP
        .follow
        .headers("User-Agent" => resolve(:user_agent))
    end

    def device_page_html
      get("#{resolve("external_apis.gsm_arena")}/#{query}.php").to_s
    end

    def search_results_html
      get(resolve("external_apis.gsm_arena"), params: { sName: query }).to_s
    end
  end
end
