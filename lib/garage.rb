class Garage
  attr_accessor :bikes

	def initialize
	  @bikes = []
	end

  def loading_area(broken_bikes)
    @bikes = broken_bikes
    fixing_bikes(@bikes)
    @bikes
  end

  def fixing_bikes(broken_bikes)
    @bikes.clear
    broken_bikes.each do |bike|
      bike.working = true
      @bikes << bike
    end
    @bikes
  end

  def return_bikes
    fixed_bikes = []
		@bikes.each do |bike|
				fixed_bikes << bike
		end
    @bikes.clear
	  fixed_bikes
  end

end
