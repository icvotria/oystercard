require 'journey'

describe Journey do
  subject(:journey) { described_class.new }
  let(:entry_station) { double :station}
  let(:exit_station) { double :station}

  describe 'start' do
    before(:each) do
      journey.start("Elephant & Castle")
    end

    it 'stores the entry station' do
      expect(journey.entry_station).to eq "Elephant & Castle"
    end

    it 'returns true when touch_in not followed by touch_out' do
      expect(journey).to be_in_journey
    end
  end
end