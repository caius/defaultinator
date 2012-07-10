# Defaultinator

Allows you to set default values when setting attributes using `attr_accessor` or `attr_reader`. Saves having to define attributes then instantly override them to set a default method.

Turns this:

    class Foo
      attr_accessor :things
      def things
        @things ||= []
      end
    end

into this:

    class Foo
      attr_accessor :things, default: []
    end

Also works with `attr_accessor` or `attr_reader` in modules, and with passing multiple attributes to define at once.

## Installation

Add this line to your application's Gemfile:

    gem 'defaultinator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install defaultinator

## Usage

If you're not setting default values for the attribute, then just use `attr_accessor` (or `attr_reader`) as normal including setting multiple attributes at once.

    attr_accessor :foo
    attr_accessor :sed, :fred
    attr_reader :bar
    attr_reader :george, :paul

If you want default values, it's much the same but just pass a hash as the last argument stating what the default value is.

    attr_accessor :foo, default: true
    attr_accessor :sed, :fred, default: []
    attr_reader :bar, default: {}
    attr_reader :george, :paul, default: false

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
