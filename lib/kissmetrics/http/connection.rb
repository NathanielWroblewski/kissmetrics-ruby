require 'faraday_middleware'

module KISSmetrics
  module Connection
    def connection
      @connection ||= Faraday.new(base_url, connection_options) do |connection|
        connection.request :json
        connection.response :json
        connection.use FaradayMiddleware::Rashify

        connection.adapter :net_http
      end
    end

    def connection_options
      @connection_options ||= {
        headers: {
          accept: 'application/json',
          user_agent: "KISSmetrics-ruby #{KISSmetrics::VERSION}"
        },
        request: {
          open_timeout: 10,
          timeout: 30
        }
      }
    end
  end
end
