require "spec_helper"

describe Fsck do
  before :each do
    @obj = Class.new { include Fsck }.new
  end
    
  describe "method is called" do
    it "should match method with fluff at the beginning" do
      @obj.should_receive(:the_method)
      @obj.call_the_method
    end
    
    it "should match method with fluff at the end" do
      @obj.should_receive(:the_method)
      @obj.the_method_is_called
    end
    
    it "should match method with fluff in the middle" do
      @obj.should_receive(:the_method)
      @obj.the_awesome_method
    end
  end
  
  describe "return value" do
    it "should return the value from the method" do
      @obj.should_receive(:the_method).and_return(42)
      @obj.the_method_will_obey.should eql(42)
    end
  end
  
  describe "method parameters" do
    it "should pass along all parameters" do
      @obj.should_receive(:the_method).with(42, [1,2,3], "yo dawg")
      @obj.the_awesome_method(42, [1,2,3], "yo dawg")
    end
  end
  
  describe "whacky method names" do
    it "should pass the regex when containing regex special characters" do
      @obj.should_receive(:[])
      @obj.send "square_[]_brackets"
    end
    
    it "should not match within words" do
      @obj.should_not_receive(:the_method)
      @obj.the_methods
    end
    
    it "should allow fluff at the end of punctuated methods" do
      @obj.should_receive(:the_method?)
      @obj.the_method_will_be_called?
    end
  end
  
  describe "aliasing" do
    it "should alias method on the first call" do
      @obj.stub(:the_method)
      @obj.calling_the_method
      @obj.methods.should include(:calling_the_method)
    end
    
    it "should alias method defined in the class in the scope of the class" do
      @obj.class.send(:define_method, :the_method) {}
      @obj.calling_the_method
      @obj.class.instance_methods(false).should include(:calling_the_method)
    end
    
    it "should alias singleton method in the scope of the singleton" do
      @obj.define_singleton_method(:sing_method) {}
      @obj.calling_sing_method
      @obj.sinlgeton_methods(false).should include(:calling_sing_method)
    end
  end
end