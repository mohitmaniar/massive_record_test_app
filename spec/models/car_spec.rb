require 'spec_helper'

describe Car do
  subject { Car.make }

  describe "validations" do
    it { should be_valid }
  end
end
