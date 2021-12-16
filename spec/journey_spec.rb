require 'journey'

describe Journey do
  subject(:journey) { described_class.new }
  let(:entry_station) { double :station}
  let(:exit_station) { double :station}

  describe 'start' do
    before(:each) do
      journey.start("Elephant & Castle")
    end

    it 'saves the entry station' do
      expect(journey.entry_station).to eq "Elephant & Castle"
    end

    it 'returns true when touch_in not followed by touch_out' do
      expect(journey).to be_in_journey
    end
  end

  describe 'end' do
    before(:each) do
      journey.start("Elephant & Castle")
      journey.end("Home")
    end

    it 'saves a journey' do
      expect(journey.journeys_list).to eq([{:in => "Elephant & Castle", :out => "Home"}])
    end
  end

  describe 'save journey' do
    it 'resets exit station to nil' do
      expect(journey.entry_station).to eq nil
    end

    it 'resets exit station to nil' do
      expect(journey.exit_station).to eq nil
    end
  end

  describe 'fare' do
    it 'returns the minimum fare' do
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end
  end
end