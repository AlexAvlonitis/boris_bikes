class Bike
	attr_accessor :working

	def working?
		@working
	end

	def broken
		@working = false
	end


end
