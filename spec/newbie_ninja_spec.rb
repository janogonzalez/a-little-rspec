require 'rspec'
require 'ninja'

describe Ninja do
  before(:each) do
    @ninja = Ninja.new
    @another_ninja = Ninja.new
  end
  
  describe "default values" do
    it "should have a default power of 10" do
      @ninja.power.should == 10
    end
    
    it "should have a default health of 10" do
      @ninja.power.should == 10
    end
    
    it "should not be dead" do
      @ninja.should_not be_dead
    end
  end
  
  describe "attack" do
    it "should do damage equal to half its power" do
      @ninja.attack(@another_ninja)
      @another_ninja.health.should == 5
    end
  end
  
  describe "super_attack!" do
    it "should do damage equal to half its power plus 5" do
      @ninja.super_attack!(@another_ninja)
      @another_ninja.health.should == 0
    end
    
    it "should diminish its health by 5" do
      @ninja.super_attack!(@another_ninja)
      @ninja.health.should == 5
    end
    
    context "ninja without enough health" do
      before do
        @ninja_without_health = Ninja.new(5, 10)
      end
      
      it "should do a normal attack instead" do
        @ninja_without_health.super_attack!(@another_ninja)
        @another_ninja.health.should == 5
      end
    end
  end
  
  context "dead ninja" do
    before do
      @dead_ninja = Ninja.new(0, 10)
    end
    
    it "should be dead" do
      @dead_ninja.should be_dead
    end
  end
end