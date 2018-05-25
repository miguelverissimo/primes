# Primes

Just a standalone tool to print out a multiplication table of the first N prime numbers to STDOUT

## Installation

Clone the repo:

    $ git clone https://github.com/miguelverissimo/primes

Navigate to the gem's directory and install dependencies:

    $ cd primes && bunde install

...Make sure tests are passing:

    $ rake

... And build & install:

    $ bundle exec rake install

## Usage

    $ primes [number of prime numbers]

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/primes.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
