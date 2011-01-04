require "spec_helper"

describe Fsck do
  describe "method is called" do
    before :each do
      @class = Class.new do
        include Fsck
        
        def the_method
        end
      end
    end
    
    it "should match method with fluff at the beginning" do
      obj = @class.new
      obj.should_receive(:the_method)
      obj.call_the_method
    end
    
    it "should match method with fluff at the end" do
      obj = @class.new
      obj.should_receive(:the_method)
      obj.the_method_is_called
    end
    
    it "should match method with fluff in the middle" do
      obj = @class.new
      obj.should_receive(:the_method)
      obj.the_awesome_method
    end
  end
  
  describe "return value" do
    before :each do
      @class = Class.new do
        include Fsck
        
        def the_method
          42
        end
      end
    end
    
    it "should return the value from the method" do
      obj = @class.new
      obj.the_method_will_obey.should eql(42)
    end
  end
  
  describe "method parameters" do
    before :each do
      @class = Class.new do
        include Fsck
        
        def the_method(*args)
        end
      end
    end
    
    it "should pass along all parameters" do
      obj = @class.new
      obj.should_receive(:the_method).with(42, [1,2,3], "yo dawg")
      obj.the_awesome_method(42, [1,2,3], "yo dawg")
    end
  end
end