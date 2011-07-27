require 'rspec'
require 'ninja'

describe Ninja do
  its(:power) { should == 10 }
  its(:health) { should == 10 }
  it { should_not be_dead }
  
  let(:another_ninja) { Ninja.new }
  
  describe "#attack" do
    it "should do damage equal to half its power" do
      subject.attack(another_ninja)
      another_ninja.health.should == 5
    end
  end
  
  describe "#super_attack!" do
    it "should do damage equal to half its power plus 5" do
      subject.super_attack!(another_ninja)
      another_ninja.health.should == 0
    end
    
    it "should diminish its health by 5" do
      subject.super_attack!(another_ninja)
      subject.health.should == 5
    end
    
    context "ninja without enough health" do
      subject { Ninja.new(5, 10) }
      
      it "should do a normal attack instead" do
        subject.super_attack!(another_ninja)
        another_ninja.health.should == 5
      end
    end
  end
  
  context "dead ninja" do
    subject { Ninja.new(0, 10) }
    
    it { should be_dead }
  end
end