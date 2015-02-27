require 'kissmetrics/resources/query'
require 'kissmetrics/api_interface/endpoints'

module KISSmetrics
  class Product
    extend KISSmetrics::Query
    include KISSmetrics::Endpoints

    def self.events
      query[:path] += ENDPOINTS[:event][:path]
      self
    end

    def self.reports
      query[:path] += ENDPOINTS[:report][:path]
      self
    end

    def self.metrics
      query[:path] += ENDPOINTS[:metric][:path]
      self
    end

    def self.properties
      query[:path] += ENDPOINTS[:property][:path]
      self
    end
  end
end
