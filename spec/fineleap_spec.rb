RSpec.describe Fineleap do
  it "has a version number" do
    expect(Fineleap::VERSION).not_to be nil
    expect(Fineleap::VERSION).to eq('0.1.0')
  end
end
