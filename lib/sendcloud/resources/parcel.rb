module Sendcloud
  class ParcelResource < Resource
    def create(**attributes)
      Parcel.new post_request("parcels", body: attributes).body.dig("parcel").first
    end
  end
end
