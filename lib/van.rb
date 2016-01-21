class Van
  attr_accessor :bikes, :capacity
	DEFAULT_CAPACITY = 20

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
	  @bikes = []
	end

	def loading(bikes)
		@bikes = bikes
	end

  def unload
    broken_bikes = []
		@bikes.each do |bike|
				broken_bikes << bike
		end
    @bikes.clear
    broken_bikes
  end

end
