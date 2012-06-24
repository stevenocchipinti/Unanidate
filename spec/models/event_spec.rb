require 'spec_helper'

describe Event do

  it "has a valid factory" do
    FactoryGirl.build(:event).should be_valid
  end

  it "is invalid without a title" do
    FactoryGirl.build(:event, title: nil).should_not be_valid
  end

  describe "#select" do

    before(:each) do
      @event = FactoryGirl.create :event_with_options
      @option = @event.options.last
    end

    context "with a valid option parameter" do
      it "sets the selected_option attribute based on the given option_id" do
        @event.select(@option.id)
        @event.selected_option.should == @option
      end
    end

    context "with a invalid option parameter" do
      it "raises an exception if the option doesn't exist" do
        lambda { @event.select 99 }.should raise_error
      end

      it "raises an exception if the option doesn't belong to this event" do
        lambda {
          @event.select FactoryGirl.create(:option).id
        }.should raise_error
      end

    end

  end

  describe "#unselect" do

    it "unsets the selected_option attribute" do
      @event = FactoryGirl.create :event_with_options
      @event.selected_option = @event.options.last
      @event.selected_option.should == @event.options.last
      @event.unselect
      @event.selected_option.should == nil
    end

  end
end
