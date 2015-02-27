require 'kissmetrics/resources/query'
require 'kissmetrics/api_interface/endpoints'

module KISSmetrics
  class Account
    extend KISSmetrics::Query
    include KISSmetrics::Endpoints

    def self.products
      query[:path] += ENDPOINTS[:product][:path]
      self
    end
  end
end
