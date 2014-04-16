# WhatsUpDoc

Responds with `200` for a specific path. Useful for load balancers to hit without needing to go through the whole rails
stack. Insert before logging middleware, so that a load balancer doesn't pollute your log with requests.

## Installation

Add this line to your application's Gemfile:

    gem 'whats_up_doc'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install whats_up_doc

## Usage

In a rackup file:

``` ruby
use WhatsUpDoc::Middleware, path: '/my-up-path'
```

Or in Rails (config/application.rb):

``` ruby
config.middleware.use(WhatsUpDoc::Middleware, path: '/my-up-path')
```

The default path is `/up`.

## Contributing

1. Fork it ( http://github.com/secondrotation/whats_up_doc/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
