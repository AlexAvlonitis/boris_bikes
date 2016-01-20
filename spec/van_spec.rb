require 'bike'
require 'dockingStation'
require 'van'

describe Van do
  it 'the van can check if there are any broken bikes in
      docking station and release' do
      bike = Bike.new
      bike2 = Bike.new
      ds = DockingStation.new
      ds.dock_bike(bike)
      ds.dock_bike(bike2, true)
      expect(subject.collect_broken(ds.bikes)).to be_an Hash

  end
end
