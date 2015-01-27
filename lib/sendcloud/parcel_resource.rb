module Sendcloud
  class ParcelResourceException < StandardError; end

  class ParcelResource < Base
    def create_parcel(name, address, city, postal_code, country, shipment = {id: 1, options: []}, method_params = {})
      response = self.class.post('/parcels',
                                 body: {
                                     parcel: {
                                         name: name,
                                         address: address,
                                         city: city,
                                         postal_code: postal_code,
                                         country: country,
                                         shipment: shipment,
                                         requestShipment: false
                                     }.merge(method_params).
                                       merge(telephone: '', email: '', data: [])
                                 }.to_json,
                                  basic_auth: auth,
                                  headers: {'Content-Type' => 'application/json'}
      )
      if response['error']
        raise ParcelResourceException.new(response['error']['message'])
      end
      response['parcel']
    end

    def adjust_parcel(parcel_id)
      response = self.class.put('/parcels',
                                body: {
                                    parcel: {
                                        id: parcel_id,
                                        requestShipment: true
                                    }
                                }.to_json,
                                basic_auth: auth,
                                headers: {'Content-Type' => 'application/json'}
      )
      if response['error']
        raise ParcelResourceException.new(response['error']['message'])
      end
      response['parcel']
    end

    def show_parcel(parcel_id)
      response = self.class.get("/parcels/#{parcel_id}", basic_auth: auth)
      if response['error']
        raise ParcelResourceException.new(response['error']['message'])
      end
      response['parcel']
    end

    def get_label_parcel(parcel_id)
      response = self.class.get("/labels/#{parcel_id}", basic_auth: auth,
                                headers: {'Content-Type' => 'application/json'})
      if response['error']
        raise ParcelResourceException.new(response['error']['message'])
      end
      response['label']
    end

  end

end