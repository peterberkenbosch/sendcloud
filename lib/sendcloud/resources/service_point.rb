module Sendcloud
  class ServicePointResource < Resource
    def list(**params)
      response = get_request("service-points", params: params)
      Collection.from_response(response, key: nil, type: ServicePoint)
    end

    def carriers
      get_request("carriers").body
    end

    def check_availability(service_point_id:)
      get_request("service-points/#{service_point_id}/check-availability").body
    end
  end
end
