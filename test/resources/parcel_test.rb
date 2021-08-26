require "test_helper"

class ParcelResourceTest < Minitest::Test

  def test_list
    stub = stub_request("parcels", response: stub_response(fixture: "parcels/list"))
    client = Sendcloud::Client.new(api_key: "key", api_secret: "secret", adapter: :test, stubs: stub)
    parcels = client.parcel.list

    assert_equal Sendcloud::Collection, parcels.class
    assert_equal Sendcloud::Parcel, parcels.data.first.class    
  end

  def test_create
    payload = {
      parcel: {
        name: "John Doe",
        company_name: "Sendcloud",
        address: "Insulindelaan",
        house_number: "115",
        city: "Eindhoven",
        postal_code: "5642CV",
        telephone: "+31612345678",
        request_label: true,
        email: "john@doe.com",
        data: [],
        country: "NL",
        shipment: {
          id: 8
        },
        weight: "10.000",
        order_number: "1234567890",
        insured_value: 2000,
        total_order_value_currency: "GBP",
        total_order_value: "11.11",
        quantity: 1,
        shipping_method_checkout_name: "DHL Express Domestic"
      }
    }
    stub = stub_request("parcels", method: :post, body: payload, response: stub_response(fixture: "parcels/create", status: 201))
    client = Sendcloud::Client.new(api_key: "key", api_secret: "secret", adapter: :test, stubs: stub)
    parcel = client.parcel.create(**payload)
    assert_equal "John Doe", parcel.name
  end
end
