module Sendcloud
  class Base
    include HTTParty
    format :json
    attr_accessor :api_key, :api_secret

    #
    # @param api_key [String] the `apikey` from your account settings
    # @param api_secret [String] the `apisecret` from your account settings
    def initialize(api_key, api_secret)
      self.api_key = api_key
      self.api_secret = api_secret
    end

    # get the auth hash to use for all the requests
    # since the sendcloud api uses basic authentication
    # it will be used in the subclasses like this:
    # `HTTParty.get("http://twitter.com/statuses/public_timeline.json", :basic_auth => auth)`
    #
    # @return [Hash] the basic auth hash based on the api_key and api_secret
    def auth
      { username: api_key, password: api_secret}
    end

  end
end
