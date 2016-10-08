EXTERNAL_APIS = {
  gsm_arena: {
    device_url: "http://gsmarena.com",
    search_url: "http://gsmarena.com/results.php3"
  }
}.freeze

class Container
  extend Dry::Container::Mixin
end

Container.namespace(:external_apis) do
  EXTERNAL_APIS.each do |name, hash|
    namespace(name) do
      hash.each { |key, url| register(key, -> { url }, memoize: true) }
    end
  end
end
Container.register(
  :http_client,
  -> { HTTP.follow.headers("User-Agent" => UserAgents.rand) },
  memoize: true
)
