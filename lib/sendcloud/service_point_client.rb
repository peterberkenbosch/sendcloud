module Sendcloud
  class ServicePointClient
    BASE_URL = "https://servicepoints.sendcloud.sc/api/v2"

    attr_reader :api_key, :adapter

    def initialize(api_key:, adapter: Faraday.default_adapter, stubs: nil)
      @api_key = api_key
      @adapter = adapter

      # Test stubs for requests
      @stubs = stubs
    end

    def service_point
      ServicePointResource.new(self)
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.request :authorization, :AccessToken, api_key
        conn.use FaradayMiddleware::FollowRedirects, {clear_authorization_header: false}
        conn.request :json
        conn.response :json, content_type: "application/json"
        conn.adapter adapter, @stubs
      end
    end
  end
end
