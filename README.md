# KISSmetrics Ruby Library

This gem is a [fluent](http://martinfowler.com/bliki/FluentInterface.html) ruby
wrapper for the [KISSmetrics](https://www.kissmetrics.com/) API.  It strives to
adhere to the [UNIX philosophy](http://en.wikipedia.org/wiki/Unix_philosophy#Eric_Raymond.E2.80.99s_17_Unix_Rules)
Rule of Least Surprise by following
[ActiveRecord](https://github.com/rails/rails/tree/master/activerecord)
syntax, so that you can spend less time reading docs and more time getting on
with your life.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kissmetrics-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kissmetrics-ruby

## Configuration

If you're using Rails, you'll create an initializer to set your API key:

```rb
# /config/initializers/kissmetrics.rb

KISSmetrics.configure do |km|
  km.api_key = ENV['MY_KISSMETRICS_API_KEY']
end
```

## Usage

|Description|Implementation|
|---|---|
|Fetch all accounts|`KISSmetrics::Account.all`|
|Fetch single account|`KISSmetrics::Account.find('8d637290-a04f-0132-83a0-22000ab4dcd7')`|

## Contributing

1. [Fork it](https://github.com/nathanielwroblewski/kissmetrics-ruby/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
