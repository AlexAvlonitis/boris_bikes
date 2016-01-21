require 'van'
require 'docking_station'

describe Van do
  subject(:Van) {described_class.new}

  it { is_expected.to respond_to :load }

  describe "#load" do
    it "loads broken bikes from the docking station" do
      expect (subject.load(broken_bikes)).to be_an Array
    end
  end

end
