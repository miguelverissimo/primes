RSpec.describe Primes::Collection  do
  before(:all) do
    @collection = Primes::Collection.new 19
    @primes     = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
  end

  it "defaults to a cap of 10" do
    @default_collection = Primes::Collection.new
    expect(@default_collection.cap).to eq 10
  end

  it "accepts an arbitrary cap" do
    expect(@collection.cap).to eq 19  
  end

  it "asserts a number is prime" do
    non_primes = [0, 1, 6, 8, 12, 15, 20, 21, 27, 30, 35, 40, 44, 45, 55, 60, 70, 75, 76]

    @primes.each do |prime|
      expect(@collection.prime?(prime)).to be true
    end

    non_primes.each do |non_prime|
      expect(@collection.prime?(non_prime)).to be false
    end
  end

  it "returns a collection of the first n primes" do
    expect(@collection.first_primes).to eq @primes
  end
end