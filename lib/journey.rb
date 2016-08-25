class Journey

  MIN_FARE = 1
  PENALTY_FARE = 6

  attr_reader :journey

  def initialize(entry_station)
    @entry_station = entry_station
    @exit_station = nil
  end

=begin
  def initialize(entry_station: nil, exit_station: nil)
    @journey = {entry_station: entry_station, exit_station: exit_station}
  end
=end

  def complete?
    @journey[:entry_station] != nil and @journey[:exit_station] != nil
  end

  def finish(exit_station)
    @exit_station = exit_station
    {:entry_station => @entry_station, :exit_station => @exit_station}
  end

  def fare
    complete? ? MIN_FARE : PENALTY_FARE
  end

end
