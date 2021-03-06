require 'kissmetrics/version'
require 'kissmetrics/api_interface/endpoints'
require 'kissmetrics/resources/account'
require 'kissmetrics/resources/event'
require 'kissmetrics/resources/metric'
require 'kissmetrics/resources/product'
require 'kissmetrics/resources/property'
require 'kissmetrics/resources/query'
require 'kissmetrics/http/connection'
require 'kissmetrics/http/request'
require 'kissmetrics/configuration'

module KISSmetrics
  extend KISSmetrics::Endpoints
  extend KISSmetrics::Request
  extend KISSmetrics::Connection
  extend KISSmetrics::Configuration
end
