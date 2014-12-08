require 'spec_helper'

describe Sendcloud::ShippingMethod do

  context ".list" do
    it "returns the list of available shipping methods" do
      sm = Sendcloud::ShippingMethod.new("key", "secret")
      VCR.use_cassette('get_shipping_methods') do
        methods = sm.list
        expect(methods).to_not be_empty
      end
    end
  end

  context ".get" do
    context "with invalid shipping_method id" do
      it "will return a proper message" do
        sm = Sendcloud::ShippingMethod.new("key", "secret")
        VCR.use_cassette('get_wrong_shipping_method') do
          expect{sm.get(99)}.to raise_error(Sendcloud::ShippingMethodException, "Can't find shipping method with given ID (99)")
        end
      end
    end
  end

end
