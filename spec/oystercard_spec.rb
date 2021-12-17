# frozen_string_literal: true

require 'oystercard'
require 'journey'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  let(:station) { double :station }
  
  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }
    
    it 'can top up the balance' do
      expect { oystercard.top_up 1 }.to change { oystercard.balance }.by 1
    end
    
    it 'raises error message if limit exceeded' do
      limit = Oystercard::BALANCE_LIMIT
      oystercard.top_up(limit - oystercard.balance)
      message = "Error: £#{limit} limit reached"
      expect { oystercard.top_up 10 }.to raise_error message
    end
  end
  
  describe '#touch_in' do
    it 'should change the status of in_journey to true' do
      oystercard.touch_in(station)
      expect(oystercard).to be_in_journey
    end
    
    it 'should raise error when below minimum limit' do
      oystercard.top_up(-oystercard.balance) # to make balance = 0
      message = 'You haven\'t got enough money'
      expect { oystercard.touch_in(station) }.to raise_error message
    end
  end
  
  context 'when oystercard has touched in' do
    before(:each) do
      oystercard.touch_in(station)
    end

    it 'touch_out should change the status of in_journey? to false' do
      oystercard.touch_out(station)
      expect(oystercard).to_not be_in_journey
    end
    
    it 'touch_out should deduct fare from balance' do
      expect { oystercard.touch_out(station) }.to change{oystercard.balance}.by(-Journey::MINIMUM_FARE)
    end
  end
end
