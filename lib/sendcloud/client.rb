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

    def parcel_status
      ParcelStatusResource.new(self)
    end

    def shipping_method
      ShippingMethodResource.new(self)
    end

    def label
      LabelResource.new(self)
    end

    def service_point
      service_point_client = ServicePointClient.new(api_key: api_key, adapter: adapter, stubs: stubs)
      service_point_client.service_point
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.request :basic_auth, api_key, api_secret
        conn.request :json
        conn.response :json, content_type: "application/json"
        conn.adapter adapter, @stubs
      end
    end
  end
end
