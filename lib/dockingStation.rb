require_relative 'bike'
require_relative 'van'
require_relative 'garage'
class DockingStation

attr_reader :capacity

DEFAULT_CAPACITY=20

def initialize(capacity=DEFAULT_CAPACITY)
	@bikes = []
	@capacity = capacity
end

def bikes
	@bikes.dup
end

	def release_bike
    fail "No bikes available" if empty?
  		for i in 0...@bikes.size
      bike = @bikes[i]
      return @bikes.delete_at(i) if bike.working
		end
		fail "The bike is not working"
	end


	def dock(bike)
		fail 'Docking station full' if full?
		@bikes << bike
	end

	def broken_bikes
		broken_bikes = bikes.select { |bike| bike if bike.working == false}
		@bikes = bikes.select! {|bike| bike if bike.working }
		broken_bikes
	end

	def receive_bikes(fixed_bikes)
		fixed_bikes.each {|bike| @bikes << bike}
		fixed_bikes
	end

	private

	def full?
		@bikes.count >= capacity
	end

	def empty?
		@bikes.empty?
	end
end
