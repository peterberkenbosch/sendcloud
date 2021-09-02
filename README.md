# Sendcloud

![Tests](https://github.com/peterberkenbosch/sendcloud/workflows/Ruby/badge.svg)

Clean, fast Ruby implementation for the shipping and service point [Sendcloud API's](https://www.sendcloud.com/api/)

* [Shipping API](https://docs.sendcloud.sc/api/v2/shipping/)
* [Service Point API](https://docs.sendcloud.sc/api/v2/service-points/)

The [Return Portal API](https://docs.sendcloud.sc/api/v2/return-portal/) is currently not implemented.


This README is for the (unreleased) complete rewrite v3 of this library! 
Previous releases can be found here: https://github.com/peterberkenbosch/sendcloud/releases

[Full Documentation](https://peterberkenbosch.gitbook.io/sendcloud-ruby/v/main/)
## Installation

Add this line to your application's Gemfile to use this version.

```ruby
gem 'sendcloud-ruby', github:'peterberkenbosch/sendcloud' require 'sendcloud'
```

And then execute:

```sh
  $ bundle install
```

Or install it yourself as:

```sh
$ gem install sendcloud-ruby
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/peterberkenbosch/sendcloud.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
