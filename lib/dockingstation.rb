require_relative 'bike'

class DockingStation
  CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity = CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    # Bike.new
    fail 'No bikes available' if empty?
    @bikes.each  do |bike|
      raise 'Can not release a broken bike' if bike.broken
    end
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking Station is full' if full?
    @bikes.push(bike)
  end

  def report_broken(bike)
    bike.broken?
  end



  private

  def full?
    @bikes.length >= CAPACITY # returns automatically true or false
  end

  def empty?
    @bikes.empty?
  end
end
