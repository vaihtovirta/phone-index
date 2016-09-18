ENV["RAILS_ENV"] = "test"
require "spec_helper"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "vcr"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  config.include RSpec::Rails::RequestExampleGroup, type: :request, file_path: %r{spec\/controllers}
  config.include Helpers
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.default_cassette_options = {
    record: :new_episodes,
    re_record_interval: 7.days
  }
  config.hook_into :webmock
end
