$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require 'bundler/setup'
Bundler.setup

require "pipedrive_api"
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|

end
