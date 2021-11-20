class Bike
  attr_reader :broken
  def working?
   @broken = false
  end

  def broken?
    @broken = true
  end
end
