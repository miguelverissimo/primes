RSpec.describe Primes do
  it 'has a version number' do
    expect(Primes::VERSION).not_to be nil
  end

  it 'returns the base directory' do
    expect(Primes.gem_root).not_to be_empty
  end
end
