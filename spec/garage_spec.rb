require 'van'
require 'docking_station'
require 'bike'
require 'garage'

describe Garage do
  subject(:Garage) {described_class.new}

  it { is_expected.to respond_to :fixing_bikes }

  describe "#receive_bikes" do
    it "returns the broken bikes to be fixed" do
      bike = Bike.new
      bike2 = Bike.new
      bike3 = Bike.new
      ds = DockingStation.new
      bike.broken
      bike2.broken
      bike3.broken
      ds.dock(bike)
      ds.dock(bike2)
      ds.dock(bike3)
      van = Van.new
      loaded_van = van.loading(ds.broken_bikes)
      expect(subject.loading_area(loaded_van)).to be_an Array
    end
  end

  describe "#fixing_bikes" do
    it "fixes the bikes" do
      bike = Bike.new
      bike2 = Bike.new
      bike3 = Bike.new
      ds = DockingStation.new
      bike.broken
      bike2.broken
      bike3.broken
      ds.dock(bike)
      ds.dock(bike2)
      ds.dock(bike3)
      van = Van.new
      loaded_van = van.loading(ds.broken_bikes)
      expect(subject.fixing_bikes(loaded_van)).to be_an Array
    end
  end

  describe "#return_bikes" do
    it "Gives the fixed bikes to the van" do
      bike = Bike.new
      bike2 = Bike.new
      bike3 = Bike.new
      ds = DockingStation.new
      bike.broken
      bike2.broken
      bike3.broken
      ds.dock(bike)
      ds.dock(bike2)
      ds.dock(bike3)
      van = Van.new
      loaded_van = van.loading(ds.broken_bikes)
      unload = van.unload
      loaded = subject.loading_area(unload)
      ready = subject.return_bikes
      expect(van.loading(ready)).to be_an Array
    end
  end

end
