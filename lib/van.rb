require 'docking_station'

class Van

  attr_accessor :bikes, :capacity
	DEFAULT_CAPACITY = 20

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
	  @bikes = []
	end

	def load(*broken_bikes)
		@bikes = broken_bikes
	end

end
