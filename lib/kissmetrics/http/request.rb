require 'kissmetrics/api_interface/endpoints'

module KISSmetrics
  module Request

    include KISSmetrics::Endpoints

    def get(path, params={})
      request(:get, version_path + path, params, headers)
    end

    def post(path, params={})
      request(:post, version_path + path, params, headers)
    end

    private

    def request(method, path, params={}, headers={})
      connection.send(method.to_sym, path, params, headers).body
    end

    def headers
      {
        accept: 'application/json',
        content_type: 'application/json; charset=UTF-8',
        authorization: 'Bearer ' + api_key
      }
    end
  end
end
