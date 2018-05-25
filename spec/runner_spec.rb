RSpec.describe Primes::Runner do
  it 'has a version number' do
    expect(Primes::VERSION).not_to be nil
  end

  it 'returns the base directory' do
    expect(Primes.gem_root).not_to be_empty
  end

  it 'performs work' do
    @worker = Primes::Runner.new 20
    expectation = IO.binread("#{support_path}/first_20_table.txt")
    expect(@worker.run).to eq expectation
  end

  it 'shows usage instructions when the params are uninteligible' do
    @worker = Primes::Runner.new 'foo'
    expect(@worker.run).to eq Primes::Cli::USAGE_TEXT
  end
end
