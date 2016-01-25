class Bike

  def working?
    true
  end

	attr_reader :working

	def initialize
		@working = true
	end

	def broken
		@working = false
	end

	def fixed
		@working = true
	end

end
