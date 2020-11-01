RSpec.describe Finleap do
  it "has a version number" do
    expect(Finleap::VERSION).not_to be nil
    expect(Finleap::VERSION).to eq('0.1.0')
  end
end
