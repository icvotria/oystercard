class JourneyLog

  attr_reader :journeys_list, :current_journey

  def initialize
    @current_journey = { in: nil, out: nil }
    @journeys_list = []
  end

  def start(station)
    @current_journey[:in] = station
  end

  def end(station)
    @current_journey[:out] = station
    save_journey
  end

  #private

  def save_journey
    @journeys_list << @current_journey
    @current_journey = { in: nil, out: nil }
  end
end