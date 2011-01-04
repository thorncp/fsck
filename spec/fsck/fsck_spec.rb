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
end