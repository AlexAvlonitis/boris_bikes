class Garage

  def broken_bikes
    @broken_bikes
  end

  def store_bikes(deliver_bikes)
    @broken_bikes = deliver_bikes
  end

  def fix_bikes
    fixed_bikes = []
    @broken_bikes.each do |bike|
      bike.fixed
      fixed_bikes << bike
    end
    @broken_bikes = []
    fixed_bikes
  end

end
