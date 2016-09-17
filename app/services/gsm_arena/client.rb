module GsmArena
  class Client
    include Concord.new(:query)

    delegate :resolve, to: Container

    def show
      device_page_html
    end

    def search
      search_results_html
    end

    private

    def device_page_html
      resolve(:http_client)
        .get("#{resolve("external_apis.gsm_arena")}/#{query}.php")
        .to_s
    end

    def search_results_html
      resolve(:http_client).
        get(resolve("external_apis.gsm_arena"), params: { sName: query })
        .to_s
    end
  end
end
