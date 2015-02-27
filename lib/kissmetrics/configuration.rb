require 'kissmetrics/utils'

module KISSmetrics
  module Configuration
    extend KISSmetrics::Utils

    mattr_accessor :api_key, :version

    def version
      @version ||= :v1
    end

    def configure
      yield self if block_given?
    end
  end
end
