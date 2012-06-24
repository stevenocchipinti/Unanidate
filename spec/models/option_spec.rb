require 'spec_helper'

describe Option do

  before(:each) do
    @event = FactoryGirl.create :event_with_options
    @option = @event.options.first
  end

  it "has a valid factory" do
    FactoryGirl.build(:option).should be_valid
  end

  describe "#selected?" do

    it "returns true if this option is selected in its event" do
      @event.selected_option = @option
      @event.save
      @option.selected?.should == true
    end

    it "returns false if the event's selected_option is not this option" do
      @option.selected?.should == false
    end

    it "returns false if there is no associated event" do
      option = FactoryGirl.build :option
      option.selected?.should == false
    end

  end
end
