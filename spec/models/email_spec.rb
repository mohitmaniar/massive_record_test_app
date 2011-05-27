require 'spec_helper'

describe Email do
  subject { Email.make }

  describe "validation" do
    it { should be_valid }

    it "should be invalid with a blank address" do
      subject.address = nil
      should have(1).error_on :address
    end
  end


  describe "#owner" do
    let(:owner) { User.make }

    it "assigns an owner" do
      subject.owner = owner
      subject.owner.should eq owner
    end

    it "assigns foreign key" do
      subject.owner = owner
      subject.owner_id.should eq owner.id
    end

    it "assigns type" do
      subject.owner = owner
      subject.owner_type.should eq owner.class.to_s
    end
  end
end
