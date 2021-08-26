# Sendcloud

Ruby API Client for the [SendCloud](https://www.sendcloud.nl) delivery platform.

Implementing https://docs.sendcloud.sc/api/v2/shipping/ and https://docs.sendcloud.sc/api/v2/service-points/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sendcloud-ruby'
```

And then execute:

```sh
  $ bundle install
```

Or install it yourself as:

```sh
$ gem install sendcloud-ruby
```

## Usage

### Parcel

To [create a Parcel](https://docs.sendcloud.sc/api/v2/shipping/#create-a-parcel) you have to send a parcel hash like so:

```ruby
  payload = {
    parcel: {
      name: "John Doe",
      company_name: "Sendcloud",
      address: "Insulindelaan",
      house_number: "115",
      city: "Eindhoven",
      postal_code: "5642CV",
      telephone: "+31612345678",
      request_label: true,
      email: "john@doe.com",
      data: [],
      country: "NL",
      shipment: {
        id: 8
      },
      weight: "10.000",
      order_number: "1234567890",
      insured_value: 2000,
      total_order_value_currency: "GBP",
      total_order_value: "11.11",
      quantity: 1,
      shipping_method_checkout_name: "DHL Express Domestic"
    }
  }

  client = Sendcloud::Client.new(api_key: "key", api_secret: "secret")
  parcel = client.parcel.create(**payload)
``` 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/peterberkenbosch/sendcloud.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
