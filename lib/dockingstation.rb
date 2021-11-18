require_relative 'bike'

class DockingStation
  attr_reader :bikes
  def initialize
    @bikes = []
  end
  def release_bike
    # Bike.new
    fail 'No bikes available' if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    # @bike = bike
    fail 'Docking Station is full' if @bikes.length >= 20
    @bikes.push(bike)
  end

  # def bike
  #   @bike
  # end
end
