require "test_helper"

class ParcelStatusResourceTest < Minitest::Test
  def test_list
    stub = stub_request("parcels/statuses", response: stub_response(fixture: "parcels_status/list"))
    client = Sendcloud::Client.new(api_key: "key", api_secret: "secret", adapter: :test, stubs: stub)
    parcel_statuses = client.parcel_status.list

    assert_equal Sendcloud::Collection, parcel_statuses.class
    assert_equal Sendcloud::ParcelStatus, parcel_statuses.data.first.class
    assert_equal "En route to sorting center", parcel_statuses.data.first.message
  end
end
