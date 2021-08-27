module Sendcloud
  class LabelResource < Resource
    def retrieve(parcel_id:)
      Label.new get_request("labels/#{parcel_id}").body.dig("label")
    end
  end
end
