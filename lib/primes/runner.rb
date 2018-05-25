module Primes
  class Runner
    attr_reader :params

    def initialize(params = nil)
      @params = params || ARGV
    end

    def run
      cli = Primes::Cli.new @params
      return cli.usage if cli.cap == -1

      collection = Primes::Collection.new cli.cap
      Primes::Printer.table_as_string collection.first_primes
    end
  end
end
