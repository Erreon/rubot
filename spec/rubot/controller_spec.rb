require "spec_helper"

module Rubot
  describe Controller do
    describe ".execute?" do
      before :each do
        @controller = Class.new(Controller) do
          command(:yo_dawg) {}
        end
      end
        
      it "should claim to be able to execute a defined command" do
        @controller.should satisfy { |c| c.execute?("yo_dawg") }
      end
      
      it "should not clame to execute an undefined command" do
        @controller.should_not satisfy { |c| c.execute?("invalid") }
      end
      
      it "should compare the string representation of the given param" do
        @controller.should satisfy { |c| c.execute?(:yo_dawg) }
      end
    end
    
    describe ".execute" do
      before :each do
        @controller = Class.new(Controller) do
          command(:yo_dawg) { "sup" }
          command(:test_instance_mehod) { my_instance_method }
          define_method(:my_instance_method) {}
        end
      end
      
      it "should execute the given command" do
        @controller.execute(:yo_dawg).should == "sup"
      end
      
      it "should raise when attempting to execute an undefined command" do
        lambda { @controller.execute :invalid }.should raise_error(NoCommandError)
      end
      
      it "should execute in the scope of an instance" do
        lambda { @controller.execute :test_instance_mehod }.should_not raise_error
      end
    end
  end
end