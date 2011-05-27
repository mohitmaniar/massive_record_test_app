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

  it "saves successfully" do
    subject.save!
    User.find(subject.id).should eq subject
  end


  describe "#cars" do
    let(:car) { Car.make }

    it "assigns cars" do
      subject.cars << car
      subject.cars.should include car
    end

    context "when user is persisted" do
      before { subject.save!  }

      it "assigns and persists cars" do
        subject.cars << car
        car.should be_persisted
      end

      it "load and returns cars from database" do
        subject.cars << car
        subject.cars.reset
        subject.cars.should_not be_loaded
        subject.cars.should include car
      end
    end
  end
end
