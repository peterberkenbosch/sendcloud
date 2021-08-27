module Sendcloud
  class ShippingMethodResource < Resource
    def list(**params)
      response = get_request("shipping_methods", params: params)
      Collection.from_response(response, key: "shipping_methods", type: ShippingMethod)
    end
  end
end
