module Sendcloud
  class ParcelStatusResource < Resource
    def list
      response = get_request("parcels/statuses")
      Collection.from_response(response, key: nil, type: ParcelStatus)
    end
  end
end
