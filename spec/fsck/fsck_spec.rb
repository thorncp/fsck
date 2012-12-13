require "spec_helper"

describe Fsck do
  subject { Class.new { include Fsck }.new }

  describe "method is called" do
    it "should match method with fluff at the beginning" do
      subject.should_receive(:the_method)
      subject.call_the_method
    end

    it "should match method with fluff at the end" do
      subject.should_receive(:the_method)
      subject.the_method_is_called
    end

    it "should match method with fluff in the middle" do
      subject.should_receive(:the_method)
      subject.the_awesome_method
    end
  end

  describe "return value" do
    it "should return the value from the method" do
      subject.should_receive(:the_method).and_return(42)
      subject.the_method_will_obey.should eql(42)
    end
  end

  describe "method parameters" do
    it "should pass along all parameters" do
      subject.should_receive(:the_method).with(42, [1,2,3], "yo dawg")
      subject.the_awesome_method(42, [1,2,3], "yo dawg")
    end
  end

  describe "whacky method names" do
    it "should pass the regex when containing regex special characters" do
      subject.should_receive(:[])
      subject.send "square_[]_brackets"
    end

    it "should not match within words" do
      subject.should_not_receive(:the_method)
      subject.the_methods
    end

    it "should allow fluff at the end of punctuated methods" do
      subject.should_receive(:the_method?)
      subject.the_method_will_be_called?
    end
  end

  describe "aliasing" do
    it "should alias method on the first call" do
      subject.stub(:the_method)
      subject.calling_the_method
      subject.methods.should include(:calling_the_method)
    end

    it "should alias method defined in the class in the scope of the class" do
      subject.class.send(:define_method, :the_method) {}
      subject.calling_the_method
      subject.class.instance_methods(false).should include(:calling_the_method)
    end

    it "should alias singleton method in the scope of the singleton" do
      subject.define_singleton_method(:sing_method) {}
      subject.calling_sing_method
      subject.sinlgeton_methods(false).should include(:calling_sing_method)
    end
  end

  describe "respond to" do
    it "should respond to fsked method" do
      subject.stub(:the_method?)
      subject.should respond_to :the_awesome_method?
    end
  end
end
