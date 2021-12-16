require 'journey'
require 'oystercard'

describe Journey do
  subject(:journey) { described_class.new }
  let(:entry_station) { double :station}
  let(:exit_station) { double :station}

  describe 'start' do
    it 'stores the entry station' do
      journey.start("Elephant & Castle")
      expect(journey.entry_station).to eq "Elephant & Castle"
    end
  end
end