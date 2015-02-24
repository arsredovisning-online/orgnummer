# Orgnummer

Util for creation and validation of the swedish organisationsnummer

## Installation

Add this line to your application's Gemfile:

    gem 'orgnummer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install orgnummer

## Changelog
0.0.1. Initial version

0.1.0. Added support for resolving of swedish organization types

## Usage

```ruby
bolag = Orgnummer.new(5568610827)

if bolag.valid?
    #do something

if bolag.type_of_organization eq :aktiebolag
   #do something
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
