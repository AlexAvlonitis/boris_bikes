class DockingStation
  DEFAULT_CAPACITY = 20
  attr_accessor :bikes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = {}
  end

  def release_bike
    raise "No bikes are available." if empty?
    current_bike = nil
    bikes.each do |k, v|
      if v == false # if the current bike is not faulty
        current_bike = k # add the bike ObjId to the var
        bikes.delete(k)  # and delete it from the hash
        break
      end
    end
    current_bike # return the previous current bike
  end

  def dock_bike(bike, faulty = false) # false is not faulty, true if you want to dock a faulty bike
    fail "Dock is full" if full?
    bikes[bike] = faulty
    report_broken(bike, faulty)
  end

  def broken_bikes # shows the faulty bikes 
    bikes.select {|k, v| v == true}

  end

  private

  def report_broken(bike, faulty)
    bikes[bike] = faulty
  end

  def full?
    bikes.length >= capacity
  end

  def empty?
    bikes.empty?
  end

end
