require 'spec_helper'

describe Sendcloud::ParcelResource do
  let!(:new_parcel){
    {
        "name"=>"Rob van den Heuvel",
        "shipment_address" => Sendcloud::ShipmentAddress.new('Torenallee', 'Eindhoven', '5617BC', 'NL')
    }
  }
  context 'create Parcel' do

    it 'with valid params' do
      pr = Sendcloud::ParcelResource.new('D74gAPTNto4N28N', 'Yb6m0YVBXtWm2zTdk')
      VCR.use_cassette('create_parcel') do
        parcel = pr.create_parcel(new_parcel['name'], new_parcel['shipment_address'], {id: 1})
        expect(parcel).not_to be_empty
        expect(parcel).to include('name'=>'Rob van den Heuvel')
        expect(parcel).to include('id')
      end
    end

    context 'without name' do
      it 'will return a error' do
        pr = Sendcloud::ParcelResource.new('D74gAPTNto4N28N', 'Yb6m0YVBXtWm2zTdk')
        VCR.use_cassette('wrong_create_parcel_without_name') do
          expect{pr.create_parcel(nil, new_parcel['shipment_address'], {id: 1})}.
              to raise_error(Sendcloud::ParcelResourceException, 'Name is required')
        end
      end
    end
  end

  context 'adjust Parcel' do
    it 'with valid parcel_id' do
      pr = Sendcloud::ParcelResource.new('D74gAPTNto4N28N', 'Yb6m0YVBXtWm2zTdk')
      VCR.use_cassette('adjust_parcel') do
        parcel = pr.create_parcel(new_parcel['name'], new_parcel['shipment_address'], {id: 1})
        adjust_parcel = pr.adjust_parcel(parcel['id'])
        expect(adjust_parcel).not_to be_empty
        expect(adjust_parcel['status']).not_to be_empty
        expect(adjust_parcel).to include('id')
      end
    end
    it 'with invalid parcel_id' do
      pr = Sendcloud::ParcelResource.new('D74gAPTNto4N28N', 'Yb6m0YVBXtWm2zTdk')
      VCR.use_cassette('adjust_with_wrong_parcel_id') do
        parcel_id = 123456
        expect{pr.adjust_parcel(parcel_id)}.to raise_error(Sendcloud::ParcelResourceException,
                                                         "Parcel is not found with ID: #{parcel_id}")
      end
    end
  end

  context 'get parcel' do
    it 'with valid parcel_id' do
      pr = Sendcloud::ParcelResource.new('D74gAPTNto4N28N', 'Yb6m0YVBXtWm2zTdk')
      VCR.use_cassette('get_parcel_info') do
        parcel = pr.create_parcel(new_parcel['name'], new_parcel['shipment_address'], {id: 1})
        info = pr.show_parcel(parcel['id'])
        expect(info).not_to be_empty
        expect(info['id']).to eql(parcel['id'])
      end
    end

    it 'with invalid parcel_id' do
      pr = Sendcloud::ParcelResource.new('D74gAPTNto4N28N', 'Yb6m0YVBXtWm2zTdk')
      VCR.use_cassette('get_parcel_error_with_invalid_pracel_id') do
        parcel_id = 123456
        expect{pr.show_parcel(parcel_id)}.to raise_error(Sendcloud::ParcelResourceException,
                                                          "You aren't authorized to get this parcel")
      end
    end
  end

  context 'get label' do
    it 'with valid parcel_id' do
      pr = Sendcloud::ParcelResource.new('D74gAPTNto4N28N', 'Yb6m0YVBXtWm2zTdk')
      VCR.use_cassette('get_label_for_parcel') do
        parcel = pr.create_parcel(new_parcel['name'], new_parcel['shipment_address'], {id: 1})
        adjust_parcel = pr.adjust_parcel(parcel['id'])
        label = pr.get_label_parcel(adjust_parcel['id'])
        expect(label['normal_printer']).not_to be_empty
        expect(label['label_printer']).not_to be_empty
      end
    end

    it 'with invalid parcel_id' do
      pr = Sendcloud::ParcelResource.new('D74gAPTNto4N28N', 'Yb6m0YVBXtWm2zTdk')
      VCR.use_cassette('get_label_for_parcel_with_invalid_id') do
        parcel_id = 123456
        expect{pr.get_label_parcel(parcel_id)}.to raise_error(Sendcloud::ParcelResourceException,
                                                              "Cannot find parcel with given Parcel ID (#{parcel_id})")
      end
    end
  end

  context 'cancel parcel' do
    it 'with valid parcel_id' do
      pr = Sendcloud::ParcelResource.new('D74gAPTNto4N28N', 'Yb6m0YVBXtWm2zTdk')
      VCR.use_cassette('cancel_parcel') do
        parcel = pr.create_parcel(new_parcel['name'], new_parcel['shipment_address'], {id: 1}, {house_number: "123"})
        cancel_parcel = pr.cancel_parcel(parcel['id'])
        expect(cancel_parcel).not_to be_empty
        expect(cancel_parcel['status']).to eql("deleted")
      end
    end

    it 'with invalid parcel_id' do
      pr = Sendcloud::ParcelResource.new('D74gAPTNto4N28N', 'Yb6m0YVBXtWm2zTdk')
      VCR.use_cassette('cancel_parcel_for_parcel_with_invalid_id') do
        parcel_id = 123456
        expect{pr.cancel_parcel(parcel_id)}.to raise_error(Sendcloud::ParcelResourceException,
                                                          "No Parcel matches the given query.")
      end
    end
  end
end