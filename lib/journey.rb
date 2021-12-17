# frozen_string_literal: true

# Journey methods for Oystercard
class Journey
  MINIMUM_FARE = 2
  PENALTY_FARE = 6

  attr_reader :journeys_list, :entry_station, :exit_station, :complete

  def initialize
    @journeys_list = []
    @complete = false
  end

  def start(station)
    @entry_station = station
    @complete = false
  end

  def end(station)
    @exit_station = station
    save_journey(@entry_station, @exit_station)
    @complete = true
  end

  def fare
    @complete ? MINIMUM_FARE : PENALTY_FARE
  end

  def in_journey? # redundant?
    !@complete
  end

  def complete?
    @complete
  end

  private

  def save_journey(entry_station, exit_station)
    journeys_list << { in: entry_station, out: exit_station }
    @entry_station = nil
    @exit_station = nil
  end
end
