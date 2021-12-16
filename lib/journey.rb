class Journey

  attr_reader :journeys_list, :entry_station, :exit_station

  @journeys_list = []

  def start(station)
    @entry_station = station
  end

  def end(station)
    @exit_station = station
  end
  
  def in_journey?
    !@entry_station.nil? && @exit_station.nil?
  end

  private

  def save_journey(entry_station, exit_station)
    @journeys_list << {:in => entry_station, :out => exit_station}
  end
end