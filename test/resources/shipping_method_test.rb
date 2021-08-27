require "test_helper"

class ShippingMethodResourceTest < Minitest::Test
  def test_list
    stub = stub_request("shipping_methods", response: stub_response(fixture: "shipping_methods/list"))
    client = Sendcloud::Client.new(api_key: "key", api_secret: "secret", adapter: :test, stubs: stub)
    shipping_methods = client.shipping_method.list

    assert_equal Sendcloud::Collection, shipping_methods.class
    assert_equal Sendcloud::ShippingMethod, shipping_methods.data.first.class
  end
end
