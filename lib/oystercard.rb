# frozen_string_literal: true

require_relative 'journey'

# Allows a user to interact with oystercard
class Oystercard
  BALANCE_LIMIT = 90
  MINIMUM_LIMIT = 1

  attr_reader :journey, :balance, :journeys_list

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

    journey.start(station)
  end

  def touch_out(station)
    journey.end(station)
    deduct(journey.fare)
  end

  def in_journey?
    journey.in_journey?
  end

  # for checking stuff works, not asked for by user stories (so far)
  #def display_journeys
  #  journey.journeys_list
  #end

  private

  def deduct(amount)
    @balance -= amount
  end
end
