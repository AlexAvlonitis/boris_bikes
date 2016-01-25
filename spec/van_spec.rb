require 'van.rb'

describe Van do

  let(:docking_station) { double :docking_station }

  describe 'responds to collect bikes' do
    it {is_expected.to respond_to(:collect_bikes).with(1).argument}
  end

  it 'collects broken bikes from a docking station' do
    bike1 = Bike.new
    bike2 = Bike.new
    bike3 = Bike.new
    bike1.broken
    bike2.broken
    station = DockingStation.new
    station.dock(bike1)
    station.dock(bike2)
    station.dock(bike3)
    expect(subject.collect_bikes(station.broken_bikes)).to eq [bike1, bike2]
  end

  it "delivers broken bikes to the garage" do
    bike1 = Bike.new
    bike2 = Bike.new
    bike3 = Bike.new
    bike1.broken
    bike2.broken
    station = DockingStation.new
    station.dock(bike1)
    station.dock(bike2)
    station.dock(bike3)
    subject.collect_bikes(station.broken_bikes)
    expect(subject.deliver_bikes).to eq [bike1, bike2]
  end

  it "collects working bikes from the garage" do
    garage = Garage.new
    bike = Bike.new
    garage.store_bikes([bike])
    expect(subject.collect_bikes(garage.fix_bikes)).to eq [bike]
  end

  it "after bike delivery empty the array" do
    subject.collect_bikes([Bike.new, Bike.new])
    ds = DockingStation.new
    ds.receive_bikes(subject.deliver_bikes)
    expect(subject.bikes).to eq []

  end

end
