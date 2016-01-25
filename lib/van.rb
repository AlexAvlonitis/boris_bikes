
class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def collect_bikes(bikes)
    @bikes = bikes
  end

  def deliver_bikes
    to_deliver = []
    @bikes.each {|bike| to_deliver << bike }
    @bikes.clear
    to_deliver
  end

end
