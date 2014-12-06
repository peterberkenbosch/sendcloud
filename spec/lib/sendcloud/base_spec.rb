require 'spec_helper'

describe Sendcloud::Base do

  context ".auth" do
    it "returns a hash for basic_auth with api key and secret" do
      basic_auth_hash = {username: "key", password: "secret"}
      expect(Sendcloud::Base.new("key","secret").auth).to eql basic_auth_hash
    end
  end

end
