require 'spec_helper'

describe Option do

  before(:each) do
    @event = Event.new title: "Test Event", description: "Test Description"
    @event.id = 1
    @option = Option.new id: 1, datetime: Time.now
    @option.id = 1
  end

  describe "#selected?" do
    it "should return true if the event's selected_option is this option" do
      pending
      # FIXME: This relationship is only setup 1-way until it is saved :(
      @event.options << @option
      @event.selected_option = @option
      @option.selected?.should == true
    end
    it "should return false if the event's selected_option is not this option" do
      @event.options << @option
      @option.selected?.should == false
    end
    it "should return false if there is no associated event" do
      @option.selected?.should == false
    end
  end
end
