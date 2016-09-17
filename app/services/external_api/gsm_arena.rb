module ExternalApi
  class GsmArena
    include Concord.new(:query)
    include Procto.call

    delegate :resolve, to: Container

    def call
      raw_html
    end

    private

    def raw_html
      HTTP
        .follow
        .headers("User-Agent" => resolve(:user_agent))
        .get(
          resolve("external_apis.gsm_arena"),
          params: { sName: query }
        )
        .to_s
    end
  end
end
