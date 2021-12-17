# frozen_string_literal: true

require_relative 'journey'

# Allows a user to interact with oystercard
class Oystercard
  BALANCE_LIMIT = 90
  MINIMUM_LIMIT = 1

  attr_reader :journey, :balance

  def initialize(balance = 5)
    @journey = Journey.new
    @balance = balance
  end

  def top_up(amount)
    raise "Error: £#{BALANCE_LIMIT} limit reached" if balance + amount > BALANCE_LIMIT

    @balance += amount
  end

  def touch_in(station)
    raise 'You haven\'t got enough money' if balance < MINIMUM_LIMIT

    journey.entry_station(station)
  end

  def touch_out(station)
    deduct(journey.fare)
    journey.exit_station(station)
  end

  def in_journey?
    !journey.complete?
  end

  # for irb tests
  #def display_journeys
  #  journey.return_log
  #end

  private

  def deduct(amount)
    @balance -= amount
  end
end
