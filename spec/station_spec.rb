require 'station'

describe Station do
  subject(:station) { described_class.new("Train Station X", 1) }

  it 'has a name' do
    expect(station.name).to eq("Train Station X")
  end

  it 'has a zone' do
    expect(station.zone).to eq(1)
  end
end