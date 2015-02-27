module KISSmetrics
  module Endpoints
    ENDPOINTS = {
      account: '/core/accounts/'
    }

    def base_url
      'https://api.kissmetrics.com'
    end

    def version_path
      ''
    end
  end
end
