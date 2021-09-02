require "test_helper"

class LabelResourceTest < Minitest::Test
  def test_retrieve
    parcel_id = "3172"
    stub = stub_request("labels/#{parcel_id}", response: stub_response(fixture: "labels/retrieve"))
    client = Sendcloud::Client.new(api_key: "key", api_secret: "secret", adapter: :test, stubs: stub)
    label = client.label.retrieve(parcel_id: parcel_id)

    assert_equal Sendcloud::Label, label.class
    assert_equal "https://panel.sendcloud.sc/api/v2/label/label_printer/3172?hash=bbfd669ee9ebb19408b85b33d181a50040fd9bc4", label.label_printer
  end

  def test_retrieve_bulk
    parcel_ids = [3172, 3171]
    payload = {
      label: {
        parcels: parcel_ids
      }
    }

    stub = stub_request("labels", method: :post, body: payload, response: stub_response(fixture: "labels/retrieve_bulk", status: 200))
    client = Sendcloud::Client.new(api_key: "key", api_secret: "secret", adapter: :test, stubs: stub)
    bulk_label = client.label.retrieve_bulk(parcel_ids: parcel_ids)
    assert_equal Sendcloud::Label, bulk_label.class
    assert_equal "https://panel.sendcloud.sc/api/v2/label/label_printer/?ids=3172,3171&hash=12a78fcd752a3764c4cb8d68f57cf045c916a7dd", bulk_label.label_printer
  end
end
