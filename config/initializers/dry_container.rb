EXTERNAL_APIS = {
  gsm_arena: "http://gsmarena.com/results.php3"
}.freeze

class Container
  extend Dry::Container::Mixin
end

Container.namespace(:external_apis) do
  EXTERNAL_APIS.each do |name, url|
    register(name, -> { url }, memoize: true)
  end
end

Container.register(:user_agent, -> { UserAgents.rand })
