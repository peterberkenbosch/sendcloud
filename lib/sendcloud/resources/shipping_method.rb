module Sendcloud
  class ShippingMethodResource < Resource
    def list(**params)
      response = get_request("shipping_methods", params: params)
      Collection.from_response(response, key: "shipping_methods", type: ShippingMethod)
    end

    def retrieve(shipping_method_id:)
      ShippingMethod.new get_request("shipping_methods/#{shipping_method_id}").body.dig("shipping_method")
    end
  end
end
