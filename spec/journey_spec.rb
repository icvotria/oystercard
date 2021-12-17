# frozen_string_literal: true

require 'journey'

describe Journey do
  subject(:journey) { described_class.new }
  let(:station) { double :station }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }

  describe 'complete?' do
    it 'returns false when still in journey' do
      journey.entry_station(station)
      expect(journey).to_not be_complete
    end
  end

  describe 'start' do
    before(:each) do
      journey.entry_station('Kings Cross')
    end

    it 'returns true when touch_in not followed by touch_out' do
      expect(journey).to_not be_complete
    end
  end

  describe 'fare' do
    it 'returns the minimum fare after touch in and out' do
      journey.entry_station('Kings Cross')
      journey.exit_station('The Moon')
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end

    it 'returns the penalty fare if no exit station' do
      journey.entry_station('Kings Cross')
      journey.entry_station('Elephant & Castle')

      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end
end
