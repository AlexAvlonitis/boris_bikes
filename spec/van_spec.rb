require 'bike'
require 'dockingStation'
require 'van'

describe Van do

  it 'Collects broken bikes from the docking station' do
    bike = Bike.new
    bike2 = Bike.new
    ds = DockingStation.new
    ds.dock_bike(bike)
    ds.dock_bike(bike2, true)
    bb = ds.broken_bikes
    expect(subject.collect_broken(bb)).to be_a Hash
  end



end
