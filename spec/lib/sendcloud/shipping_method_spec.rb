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

    context "with correct shipping_method id" do

      let(:post_nl_shipping_method_hash) {
        {
          "id"=>1,
          "name"=>"Pakket Nederland (PostNL)",
          "countries"=>[
            {
              "id"=>2,
              "iso_3"=>"NLD",
              "iso_2"=>"NL",
              "name"=>"Nederland",
              "price"=>5.8
            }
          ],
          "price"=>5.8,
          "options"=>[],
          "combinations"=>[{"id"=>1, "name"=>"Normaal pakket"}]
        }
      }

      it "will return the shipping method details" do
        sm = Sendcloud::ShippingMethod.new("D74gAPTNto4N28N", "Yb6m0YVBXtWm2zTdk")
        VCR.use_cassette('get_shipping_method') do
          shipping_method = sm.get(1)
          expect(shipping_method).to eql post_nl_shipping_method_hash
        end
      end
    end

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
