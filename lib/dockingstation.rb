require_relative 'bike'

class DockingStation
  attr_reader :bike

  def release_bike
    # Bike.new
    fail "No bikes available" unless @bike
    @bike
  end

  def dock(bike)
    # @bike = bike
    fail "Docking Station is full" if @bike
    @bike = bike
  end

  # def bike
  #   @bike
  # end
end