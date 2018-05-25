module Primes
  class Cache
    DEFAULT_PATH = '/cache/primes.txt'.freeze
    attr_accessor :file_path
    
    def initialize path = nil
      @file_path = path || default_path
    end

    def default_path
      Primes.gem_root + DEFAULT_PATH
    end

    def load
      return [] unless File.exist?(file_path)

      cached_primes = []
      File.open(file_path).each_line do |s|
        cached_primes << s.to_i
      end

      cached_primes
    end

    def save! collection
      File.open(file_path, 'w+') do |f|
        f.puts(collection)
      end
    end
  end
end