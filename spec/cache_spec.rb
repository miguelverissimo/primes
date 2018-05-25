RSpec.describe Primes::Cache do
  before(:all) do
    @dummy_file_path = support_path + '/foo.txt'
    @valid_file_path = support_path + '/primes.txt'
    @cache = Primes::Cache.new(@dummy_file_path)
  end

  after(:all) do
    File.delete(@dummy_file_path) if File.exist?(@dummy_file_path)
  end

  it 'returns a path' do
    expect(@cache.file_path).not_to be nil
  end

  it 'returns a default path' do
    @default_cache = Primes::Cache.new
    expect(@default_cache.file_path).to eq Primes.gem_root + Primes::Cache::DEFAULT_PATH
  end

  it 'accepts an arbitrary path' do
    expect(@cache.file_path).to eq @dummy_file_path
  end

  it 'loads a list of integers from a file' do
    @valid_cache = Primes::Cache.new(@valid_file_path)
    expect(@valid_cache.load.length).to be > 0
  end

  it 'returns an empty array if the file doesn\'t exist ' do
    expect(@cache.load.length).to eql 0
  end

  it 'saves a list of integers to a file' do
    list = [2, 3, 5, 7]
    @cache.save! list

    expect(File.exists?(@dummy_file_path))
    
    @new_cache = Primes::Cache.new(@dummy_file_path)
    expect(@new_cache.load).to eq list
  end
end