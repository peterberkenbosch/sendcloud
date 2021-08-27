require "test_helper"

class ShippingMethodResourceTest < Minitest::Test
  def test_list
    stub = stub_request("shipping_methods", response: stub_response(fixture: "shipping_methods/list"))
    client = Sendcloud::Client.new(api_key: "key", api_secret: "secret", adapter: :test, stubs: stub)
    shipping_methods = client.shipping_method.list

    assert_equal Sendcloud::Collection, shipping_methods.class
    assert_equal Sendcloud::ShippingMethod, shipping_methods.data.first.class
  end

  def test_retrieve
    shipping_method_id = "8"
    stub = stub_request("shipping_methods/#{shipping_method_id}", response: stub_response(fixture: "shipping_methods/retrieve"))
    client = Sendcloud::Client.new(api_key: "key", api_secret: "secret", adapter: :test, stubs: stub)
    shipping_method = client.shipping_method.retrieve(shipping_method_id: shipping_method_id)

    assert_equal Sendcloud::ShippingMethod, shipping_method.class
    assert_equal "sendcloud", shipping_method.carrier
  end
end
