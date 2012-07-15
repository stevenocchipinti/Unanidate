require 'spec_helper'

describe Option do

  before(:each) do
    @event = FactoryGirl.build :event
    @option = FactoryGirl.build :option, id: 1
  end

  it "has a valid factory" do
    @option.should be_valid
  end

  describe "#selected?" do

    it "returns true if this option is selected in its event" do
      @option.stub(:event).and_return(@event)
      @event.stub(:selected_option_id).and_return(@option.id)
      @option.selected?.should == true
    end

    it "returns false if there is no associated event" do
      @option.selected?.should == false
    end

    it "returns false if the event's selected_option is not this option" do
      # This would be an error state
      @option.stub(:event).and_return(@event)
      @event.stub(:selected_option_id).and_return(999)
      @option.selected?.should == false
    end

  end
end
