require 'van'
require 'docking_station'
require 'bike'
require 'garage'


describe Van do
  subject(:Van) {described_class.new}

  it { is_expected.to respond_to :loading }

  describe "#load" do
    it "loads broken bikes from the docking station" do
      bike = Bike.new
      bike2 = Bike.new
      bike3 = Bike.new
      bike2.broken
      bike.broken
      ds = DockingStation.new
      ds.dock(bike)
      ds.dock(bike2)
      expect(subject.loading(ds.broken_bikes)).to be_an Array
    end
  end

  describe "#unload" do
    it "unloads the broken_bikes to the garage" do
      bike = Bike.new
      bike2 = Bike.new
      bike3 = Bike.new
      bike2.broken
      bike.broken
      ds = DockingStation.new
      ds.dock(bike)
      ds.dock(bike2)
      subject.loading(ds.broken_bikes)
      unload = subject.unload
      garage = Garage.new
      expect(garage.loading_area(unload)).not_to be_empty
    end
  end

end
