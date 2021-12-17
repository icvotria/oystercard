# frozen_string_literal: true

# Journey methods for Oystercard
class Journey
  MINIMUM_FARE = 2
  PENALTY_FARE = 6

  attr_reader :journeys_list, :stations, :complete

  def initialize
    @journeys_list = []
    @stations = { in: nil, out: nil }
    @complete = false
  end

  def start(station)
    @stations[:in] = station
    @complete = false
  end

  def end(station)
    @stations[:out] = station
    @complete = true
    save_journey
  end

  def fare
    @complete ? MINIMUM_FARE : PENALTY_FARE
    #return PENALTY_FARE unless @stations[:in] && @stations[:out]
    #return MINIMUM_FARE if @stations[:in] != nil && @stations[:out] != nil
  end

  def in_journey? # redundant?
    !@complete
  end

  def complete?
    @complete
  end

  private

  def save_journey
    journeys_list << @stations
    @stations = { in: nil, out: nil }
  end
end
