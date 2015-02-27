require 'kissmetrics/resources/query'
require 'kissmetrics/api_interface/endpoints'

module KISSmetrics
  class Property
    extend KISSmetrics::Query
    include KISSmetrics::Endpoints
  end
end
