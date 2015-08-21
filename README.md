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
0.1.1. Added implementation of eql? and hash

0.1.0. Added support for resolving swedish organization types

0.0.1. Initial version



## Usage

```ruby
bolag = Orgnummer.new(5568610827)
# bolag = Orgnummer.new('5568610827') is valid
# bolag = Orgnummer.new('556861-0827') is valid
# bolag = Orgnummer.new('55') is valid but bolag.valid? will be false

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
