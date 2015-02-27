require 'kissmetrics'
require 'rspec'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixture/vcr_cassettes'
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = true
end

RSpec.configure do |config|
  config.before(:each) do
    KISSmetrics.configure do |km|
      km.api_key = ENV['KISSMETRICS_API_KEY']
      km.version = nil
    end

    KISSmetrics::Account.to_hash
    KISSmetrics::Event.to_hash
    KISSmetrics::Metric.to_hash
    KISSmetrics::Product.to_hash
    KISSmetrics::Property.to_hash
  end
end
