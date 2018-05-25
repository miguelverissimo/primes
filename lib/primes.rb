require 'primes/version'
require 'primes/cache'
require 'primes/collection'

module Primes
  def self.gem_root
    Gem::Specification.find_by_name('primes').gem_dir
  end
end
