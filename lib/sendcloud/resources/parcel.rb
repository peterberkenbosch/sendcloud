module Sendcloud
  class ParcelResource < Resource
    def list(**params)
      response = get_request("parcels", params: params)
      Collection.from_response(response, key: "parcels", type: Parcel)
    end

    def create(**attributes)
      Parcel.new post_request("parcels", body: attributes).body.dig("parcel").first
    end
  end
end
