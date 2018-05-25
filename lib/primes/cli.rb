require 'pry-byebug'

module Primes
  class Cli
    DEFAULT_CAP = 10
    attr_reader :cap
    @cap = DEFAULT_CAP

    USAGE_TEXT = "USAGE\n$ primes [number of primes]\n\nnumber_of_primes: integer, defaults to 10\n\n".freeze

    def initialize(cli_params = nil)
      @cli_params = _parse cli_params
    end

    def usage
      USAGE_TEXT
    end

    private

    def _parse(cli_params)
      parse_value = cli_params.is_a?(Array) ? cli_params[0] : cli_params
      return @cap = DEFAULT_CAP if cli_params.nil?
      begin
        # edge case if someone inputs floating point numbers, as those will be
        # cast to integer
        @cap = Integer(parse_value)
        @cap = -1 if @cap < 1
      rescue ArgumentError
        @cap = -1
      end
    end
  end
end
