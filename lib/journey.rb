# frozen_string_literal: true

# Journey methods for Oystercard

require_relative 'journey_log'

class Journey
  MINIMUM_FARE = 2
  PENALTY_FARE = 6

  attr_reader :journey_log, :complete

  def initialize
    @complete = false
    @journey_log = JourneyLog.new
  end

  def fare
    @complete ? MINIMUM_FARE : PENALTY_FARE
  end

  def entry_station(station)
    @journey_log.start(station)
    @complete = false
  end

  def exit_station(station)
    @journey_log.end(station)
    @complete = true
  end

  def complete?
    @complete
  end

  # for irb tests
  #def return_log
  #  @journey_log.journeys_list
  #end
end
