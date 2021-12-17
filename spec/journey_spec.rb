# frozen_string_literal: true

require 'journey'

describe Journey do
  subject(:journey) { described_class.new }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  describe 'complete?' do
    it 'returns false when still in journey' do
      journey.start(entry_station)
      expect(journey).to_not be_complete
    end
  end

  describe 'start' do
    before(:each) do
      journey.start(entry_station)
    end

    it 'saves the entry station' do
      expect(journey.entry_station).to eq entry_station
    end

    it 'returns true when touch_in not followed by touch_out' do
      expect(journey).to be_in_journey
    end
  end

  describe 'end' do
    before(:each) do
      journey.start(entry_station)
      journey.end(exit_station)
    end

    it 'saves a journey' do
      expect(journey.journeys_list).to eq([{ in: entry_station, out: exit_station }])
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

    it 'returns the penalty fare if no exit station' do
      journey.start(entry_station)
      # journey.start(entry_station)

      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end
end
