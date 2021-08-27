module Sendcloud
  class LabelResource < Resource
    def retrieve(parcel_id:)
      Label.new get_request("labels/#{parcel_id}").body.dig("label")
    end

    def retrieve_bulk(parcel_ids:)
      attributes = {
        label: {
          parcels: parcel_ids
        }
      }
      Label.new post_request("labels", body: attributes).body.dig("label")
    end
  end
end
