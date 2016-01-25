require_relative '../lib/bike'

describe Bike do
	it "is it working?" do
		bike = Bike.new
		expect(bike.respond_to?(:working?)).to eq true
	end

  describe 'broken' do
  it 'check if bike can become broken' do
      subject.broken
      expect(subject.working).to eq false
    end
  end

  describe '#fixed' do
    it 'fixes the bike' do
      expect(subject.fixed).to eq true
    end
  end

end
