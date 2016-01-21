class DockingStation

	attr_accessor :bikes, :capacity
	DEFAULT_CAPACITY = 20

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
	  @bikes = []
	end

	def release_bike
		working_bikes = @bikes.select { |bike| bike.working? }
		raise "There are no bikes available" if working_bikes.empty?
		released_bike = working_bikes.pop
		@bikes.delete(released_bike)
	end

	def dock(bike)
		raise "The dock is full" if full?
		@bikes << bike
	end

	def broken_bikes
		broken_bikes = []
		@bikes.each do |bike|
			if bike.working? == false
				broken_bikes << bike
			end
		end
		@bikes = @bikes - broken_bikes
		broken_bikes
	end

	private

	def full?
		@bikes.length >= capacity
	end

	def empty?
		@bikes.empty?
	end

end
