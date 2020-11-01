RSpec.describe Finleap::Customers::Geo do
  describe '.in_range' do
    subject(:customers) { described_class.in_range(distance_range) }
    let(:distance_range) { 100 }

    it 'measure distance by kms' do
      expect(Geokit::default_units).to eq(:kms)
    end

    context 'when in range 20 km' do
      let(:distance_range) { 20 }

      it 'returns zero customer' do
        expect(customers.length).to eq(0)
      end
    end

    context 'when in range 50 km' do
      let(:distance_range) { 50 }

      it 'returns one customer' do
        expect(customers.length).to eq(1)
      end
    end

    context 'when in range 100 km' do
      it 'returns 12 customers' do
        expect(customers.length).to eq(12)
      end

      it 'returns customers array sorted by user_id asc' do
        user_ids = customers.map { |customer| customer['user_id'] }
        expect(user_ids).to eq(user_ids.sort)
      end

      it 'returns customer right data' do
        customer = customers.first
        expect(customer['user_id']).to eq(4)
        expect(customer['name']).to eq('Ernesto Breitenberg')
        expect(customer['latitude']).to eq(52.94260786195436)
        expect(customer['longitude']).to eq(13.067312769068188)
      end
    end
  end
end


