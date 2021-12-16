class Journey
  MINIMUM_FARE = 2
  PENALTY_FARE = 6

  attr_reader :journeys_list, :entry_station, :exit_station

  def initialize
    @journeys_list = []
  end

  def start(station)
    @entry_station = station
  end

  def end(station)
    @exit_station = station
    save_journey(@entry_station, @exit_station)
  end

  def fare
    MINIMUM_FARE
  end
  
  def in_journey?
    !@entry_station.nil? && @exit_station.nil?
  end

  private

  def save_journey(entry_station, exit_station)
    journeys_list << {:in => entry_station, :out => exit_station}
    @entry_station = nil
    @exit_station = nil
  end
end