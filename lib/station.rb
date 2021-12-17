# frozen_string_literal: true

# Sets names and zones for a station
class Station
  attr_reader :name, :zone

  def initialize(name, zone)
    @name = name
    @zone = zone
  end
end
