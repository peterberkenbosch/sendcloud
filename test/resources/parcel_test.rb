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

  def test_retrieve
    parcel_id = "3"
    stub = stub_request("parcels/#{parcel_id}", response: stub_response(fixture: "parcels/retrieve"))
    client = Sendcloud::Client.new(api_key: "key", api_secret: "secret", adapter: :test, stubs: stub)
    parcel = client.parcel.retrieve(parcel_id: parcel_id)

    assert_equal Sendcloud::Parcel, parcel.class
    assert_equal "Insulindelaan 115", parcel.address
  end

  def test_update
    parcel_id = "3"
    body = {request_label: true}
    stub = stub_request("parcels/#{parcel_id}", method: :patch, body: body, response: stub_response(fixture: "parcels/update"))
    client = Sendcloud::Client.new(api_key: "key", api_secret: "secret", adapter: :test, stubs: stub)
    parcel = client.parcel.update(parcel_id: parcel_id, **body)

    assert_equal Sendcloud::Parcel, parcel.class
    assert_equal "Ready to send", parcel.status.message
  end

  def test_cancel
    parcel_id = "3"
    stub = stub_request("parcels/#{parcel_id}/cancel", method: :post, body: {}, response: stub_response(fixture: "parcels/canceled"))
    client = Sendcloud::Client.new(api_key: "key", api_secret: "secret", adapter: :test, stubs: stub)

    canceled_response = client.parcel.cancel(parcel_id: parcel_id)
    assert_equal Sendcloud::ParcelStatus, canceled_response.class
    assert_equal "cancelled", canceled_response.status
    assert_equal "Parcel has been cancelled", canceled_response.message
  end
end
