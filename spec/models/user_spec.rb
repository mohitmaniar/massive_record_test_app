require 'spec_helper'

describe User do
  subject { User.make }

  describe "validation" do
    it { should be_valid }

    it "should be invalid without a name" do
      subject.name = nil
      subject.should have(1).error_on :name
    end
  end
end
