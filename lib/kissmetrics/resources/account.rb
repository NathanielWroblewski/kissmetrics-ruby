require 'kissmetrics/resources/query'
require 'kissmetrics/api_interface/endpoints'

module KISSmetrics
  class Account
    extend KISSmetrics::Query
    include KISSmetrics::Endpoints

    def self.unspents
      query[:path] += ENDPOINTS[:unspents]
      query[:path].squeeze!('/')
      self
    end
  end
end
