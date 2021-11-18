require_relative 'bike'

class DockingStation
  attr_reader :bikes
  def initialize
    @bikes = []
  end

  def release_bike
    # Bike.new
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking Station is full' if full?
    @bikes.push(bike)
  end

  def full?
    @bikes.length >= 20 # returns automatically true or false
  end

  def empty?
    @bikes.empty?
  end

end
