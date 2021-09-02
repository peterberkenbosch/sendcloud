require "test_helper"

class ServicePointClientTest < Minitest::Test
  def test_api_key
    client = Sendcloud::ServicePointClient.new api_key: "key"
    assert_equal "key", client.api_key
  end
end
