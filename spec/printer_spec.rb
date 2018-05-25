RSpec.describe Primes::Printer do
  it 'pretty prints a multiplication table' do
    @collection = Primes::Collection.new 20
    expectation = IO.binread("#{support_path}/first_20_table.txt")

    expect(Primes::Printer.table_as_string(@collection.first_primes)).to eq expectation
  end
end
