require "spec_helper"

describe Fsck do
  describe "#method_missing" do
    before :each do
      @class = Class.new do
        include Fsck
        
        def the_method
          42
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
  end
end