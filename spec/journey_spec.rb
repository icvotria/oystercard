# frozen_string_literal: true

require 'journey'

describe Journey do
  subject(:journey) { described_class.new }
  let(:station) { double :station }

  describe 'complete?' do
    it 'returns false when still in journey' do
      journey.start(station)
      expect(journey).to_not be_complete
    end
  end

  describe 'start' do
    before(:each) do
      journey.start('Kings Cross')
    end

    it 'saves the entry station' do
      expect(journey.stations).to eq({ in: 'Kings Cross', out: nil })
    end

    it 'returns true when touch_in not followed by touch_out' do
      expect(journey).to be_in_journey
    end
  end

  describe 'end' do
    before(:each) do
      journey.start('Kings Cross')
      journey.end('The Moon')
    end

    it 'saves a journey' do
      expect(journey.journeys_list).to eq([{ in: 'Kings Cross', out: 'The Moon' }])
    end
  end

  describe 'save journey' do
    it 'resets stations to nil' do
      expect(journey.stations).to eq({ in: nil, out: nil })
    end
  end

  describe 'fare' do
    it 'returns the minimum fare after touch in and out' do
      journey.start('Kings Cross')
      journey.end('The Moon')
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end

    it 'returns the penalty fare if no exit station' do
      journey.start('Kings Cross')
      journey.start('Elephant & Castle')

      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end
end
