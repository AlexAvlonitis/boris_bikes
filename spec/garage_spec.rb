require 'garage.rb'
require 'bike'

describe Garage do

  describe "#store_bikes" do
    it "stores the broken bikes from the van" do
      bike = Bike.new
      bike2 = Bike.new
      bike.broken
      bike2.broken
      expect(subject.store_bikes([bike,bike2])).to eq [bike, bike2]
    end
  end

  describe '#fix_bikes' do
    it 'fixes the bikes' do
      bike = Bike.new
      bike2 = Bike.new
      bike.broken
      bike2.broken
      subject.store_bikes([bike,bike2])
      expect(subject.fix_bikes[0].working).to eq true
    end
  end



end
