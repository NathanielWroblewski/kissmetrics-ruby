require 'kissmetrics/api_interface/endpoints'
require 'kissmetrics/api_interface/api_parameters'

module KISSmetrics
  module Query
    include KISSmetrics::Endpoints
    include KISSmetrics::APIParameters

    def query
      @query ||= default_query
    end

    def default_query
      { path: endpoint_for(parent_class), params: {} }
    end

    def parent_class
      self.to_s.split('::').last.downcase.to_sym
    end

    def all
      self
    end

    def find(id)
      query[:path] += "/#{id}"
      self
    end

    def where(conditions)
      conditions.each do |resource, ids|
        api_resource = API_PARAMETERS[resource] || resource
        query[:params][api_resource] = ids
      end
      self
    end

    def limit(limit)
      query[:params][:limit] = limit
      self
    end

    alias_method :last, :limit

    def offset(number)
      query[:params][:offset] = number
      self
    end

    def to_hash
      (query_copy = query.clone) and (@query = default_query)
      method = query_copy[:params][:post] ? :post : :get
      query_copy[:params].delete(:post)
      KISSmetrics.send(method, query_copy[:path], query_copy[:params])
    end

    def [](attribute)
      to_hash[attribute]
    end

    def []=(attribute, value)
      to_hash[attribute] = value
    end

    def inspect
      to_hash.to_s
    end
  end
end
