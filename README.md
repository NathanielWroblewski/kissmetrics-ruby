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

The follow table organizes all endpoints and methods that this gem supports.
For more details on the KISSmetrics API, see their official documentation.

As in ActiveRecord, methods are chainable and order-independent, i.e.
`KISSmetrics::Account.last(10).offset(5)` would return the same results as
`KISSmetrics::Account.offset(5).last(10)` (if you could call `#last` or
`#offset` on an account resource).  All results need to be 'kicked' to
make an actual API call.  You can kick any API call by inspecting the response,
calling `#to_hash` on the response, or using any of the slice methods like
`response['meta']`.

|Description|Implementation|
|---|---|
|Fetch all accounts|`KISSmetrics::Account.all`|
|Fetch single account|`KISSmetrics::Account.find('8d637290-a04f-0132-83a0-22000ab4dcd7')`|
|Fetch account products|`KISSmetrics::Account.find('8d637290-a04f-0132-83a0-22000ab4dcd7').products`|

## Contributing

1. [Fork it](https://github.com/nathanielwroblewski/kissmetrics-ruby/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
