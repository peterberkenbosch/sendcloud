require "test_helper"

class ClientTest < Minitest::Test
  def test_api_key
    client = Sendcloud::Client.new api_key: "key", api_secret: "secret"
    assert_equal "key", client.api_key
    assert_equal "secret", client.api_secret
  end

  def test_service_points
    client = Sendcloud::Client.new api_key: "key", api_secret: "secret"
    assert_equal Sendcloud::ServicePointResource, client.service_point.class
  end
end
