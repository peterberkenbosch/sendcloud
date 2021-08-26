module Sendcloud
  class Client
    BASE_URL = "https://panel.sendcloud.nl/api/v2"

    attr_reader :api_key, :api_secret, :adapter

    def initialize(api_key:, api_secret:, adapter: Faraday.default_adapter, stubs: nil)
      @api_key = api_key
      @api_secret = api_secret
      @adapter = adapter

      # Test stubs for requests
      @stubs = stubs
    end

    def parcel
      ParcelResource.new(self)
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = BASE_URL
        conn.basic_auth(api_key, api_secret)
        conn.request :json
        conn.response :json, content_type: "application/json"
        conn.adapter adapter, @stubs
      end
    end
  end
end