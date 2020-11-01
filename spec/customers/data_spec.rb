RSpec.describe Fineleap::Customers::Data do
  describe '.all' do
    subject(:customers_data) { described_class.all }

    it 'parses finleap-connect-customers.json file' do
      expect(customers_data.length).to eq(50)
    end

    it 'returns array of hashes' do
      customer = customers_data.first
      expect(customer.class).to eq(Hash)
      expect(customer['user_id']).to eq(3)
      expect(customer['name']).to eq('Mary Pacocha III')
      expect(customer['latitude']).to eq(54.0653745433511)
      expect(customer['longitude']).to eq(15.175624975930294)
    end
  end
end
