# PipedriveAPI

A simple ruby wrapper for the [Pipedrive API](https://developers.pipedrive.com/docs/api/v1/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pipedrive_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pipedrive_api

## Usage

```ruby
# Authenticate your Pipedrive API session
PipedriveAPI::Base.auth(api_token: YOUR_API_TOKEN, account_name: YOUR_PIPEDRIVE_ACCOUNT_NAME)

# Find all records of a resource
PipedriveAPI::Person.all(<params>)
PipedriveAPI::Organisation.all(<params>)
PipedriveAPI::Pipeline.all(<params>)
PipedriveAPI::Product.all(<params>)

# Find a resource by ID
PipedriveAPI::Person.find(<id>)
PipedriveAPI::Organisation.find(<id>)
PipedriveAPI::Pipeline.find(<id>)
PipedriveAPI::Product.find(<id>)

# Find a resource by name
PipedriveAPI::Person.find_by_name(<name>, <params>)
PipedriveAPI::Organisation.find_by_name(<name>, <params>)
PipedriveAPI::Product.find_by_name(<name>, <params>)

# Create a resource
PipedriveAPI::Person.create(<params>)
PipedriveAPI::Organisation.create(<params>)
PipedriveAPI::Pipeline.create(<params>)
PipedriveAPI::Product.create(<params>)

# Update a resource
PipedriveAPI::Person.update(<id>, <params>)
PipedriveAPI::Organisation.update(<id>, <params>)
PipedriveAPI::Pipeline.update(<id>, <params>)
PipedriveAPI::Product.update(<id>, <params>)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/pipedrive_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
