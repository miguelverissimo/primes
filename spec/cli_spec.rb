RSpec.describe Primes::Cli do
  it 'defaults to 10 if no parameter is provided' do
    @cli = Primes::Cli.new nil
    expect(@cli.cap).to eq 10
  end

  it 'sets its cap to -1 if the supplied parameter is zero, negative or NaN' do
    invalid_params = [-1, 'foo', 0]
    invalid_params.each do |param|
      cli = Primes::Cli.new param
      expect(cli.cap).to eq(-1)
    end
  end

  it 'parses parameters correctly and sets its cap to the integer cast of the string' do
    valid_params = { '1' => 1, '26' => 26, '12123' => 12123 }
    valid_params.each do |str, int|
      cli = Primes::Cli.new str
      expect(cli.cap).to eq(int)
    end
  end
  
  it 'shows the usage syntax' do
    cli = Primes::Cli.new
    expect(cli.usage).to eq Primes::Cli::USAGE_TEXT
  end
end