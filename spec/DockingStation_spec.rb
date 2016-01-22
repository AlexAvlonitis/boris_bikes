require 'DockingStation.rb'

describe DockingStation do

let(:bike) { double :bike }
let(:bike2) { double :bike2 }

	it {is_expected.to respond_to :release_bike}

	describe 'initialize' do
		it 'initializes with a capacity' do
			station = DockingStation.new(40)
			expect(station.capacity).to eq 40
		end

		it 'initializes with a default capacity of 20' do
			expect(subject.capacity).to eq 20
		end
	end

	describe '#dock' do
		it 'docks a bike' do
			bike = (bike)
			bikes = [bike]
			expect(subject.dock(bike)).to eq bikes
		end

		describe '#dock' do
			it 'raises an error when full' do
				subject.capacity.times { subject.dock(bike) }
				expect { subject.dock((bike)) }.to raise_error 'Docking station full'
			end
		end


		it 'raises an error when there are no bikes available' do
			expect { subject.release_bike }.to raise_error 'No bikes available'
		end

		it "doesn't release broken bikes" do
			allow(bike).to receive(:working).and_return(false)
			subject.dock(bike)
			allow(bike2).to receive(:working).and_return(true)
			subject.dock(bike2)
			expect(subject.release_bike).to eq bike2
		end
	end

	describe '#broken_bikes' do
		it {is_expected.to respond_to :broken_bikes}

		it 'returns the broken bikes' do
			broken_bike = Bike.new
			bike = Bike.new
			broken_bike.broken
			subject.dock(broken_bike)
			subject.dock(bike)
			expect(subject.broken_bikes).to eq [broken_bike]
		end

		it 'deletes the broken bikes' do
			broken_bike = Bike.new
			bike = Bike.new
			broken_bike.broken
			subject.dock(broken_bike)
			subject.dock(bike)
			subject.broken_bikes
			expect(subject.bikes).to eq [bike]
		end
	end
end
