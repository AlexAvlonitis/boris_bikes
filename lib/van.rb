
class Van
  attr_reader :broken_bikes

  def initialize
    @broken_bikes = []
  end

  def collect_bikes(broken_bikes)
    @broken_bikes = broken_bikes
  end

  def deliver_bikes
    to_deliver = []
    @broken_bikes.each {|bike| to_deliver << bike }
    @broken_bikes.clear
    to_deliver
  end

end
