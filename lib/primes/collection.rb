module Primes
  class Collection
    attr_reader :cap

    def initialize cap = 10
        @known_primes = []
        @cap = cap
        @cache = Primes::Cache.new
    end

    def prime? number
        # prime numbers are > 1
        return false if number <= 1
        return true if number <= 3
        return false if (number % 2).zero? || (number % 3).zero?

        i = 5
        while i * i <= number
          return false if (number % i).zero? || (number % (i + 2)).zero?
          i += 6
        end
        true
    end

    def first_primes
      # load from file unless we've did it already (shouldn't ever happen)
      @known_primes = @cache.load unless @known_primes.length >= @cap

      # if the request is in the known range, return immediately
      return @known_primes.first(@cap) if @known_primes && @known_primes.length >= @cap
      
      # start checking if it's prime from the next integer, from the last known prime
      currently_checking = @known_primes.last.to_i + 1
      until @known_primes.length == @cap
        @known_primes.push(currently_checking) if prime?(currently_checking)
        currently_checking += 1
      end

      # cache the results
      @cache.save! @known_primes
      
      @known_primes
    end
  end
end