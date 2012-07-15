require 'spec_helper'

describe Event do
  it "has a valid factory" do
    FactoryGirl.build(:event).should be_valid
  end

  it "is invalid without a title" do
    FactoryGirl.build(:event, title: nil).should_not be_valid
  end


  describe "#select" do
    let(:event) { FactoryGirl.build :event }

    context "with a valid option parameter" do
      before(:each) do
        @option = mock_model(Option)
        event.should_receive(:options).and_return(mock(:find => @option))
      end

      it "sets the selected_option attribute based on the given option_id" do
        event.select(@option.id)
        event.selected_option.should == @option
      end
    end

    context "with a invalid option parameter" do
      it "raises an exception if the option doesn't exist" do
        lambda {
          event.select 99
        }.should raise_error(ActiveRecord::RecordNotFound)
      end

      it "raises an exception if the option doesn't belong to this event" do
        # Set up another event with a selected option
        other_event = FactoryGirl.build :event
        option = mock_model(Option)
        other_event.should_receive(:options).and_return(mock(:find => option))
        other_event.select(option.id)
        other_event.selected_option.should == option
        # Try to assign the previously set up option to this event
        lambda {
          event.select option
        }.should raise_error(ActiveRecord::RecordNotFound)
      end

    end
  end


  describe "#unselect" do
    it "unsets the selected_option attribute" do
      # Set up an event with a selected option
      event = FactoryGirl.build :event
      option = mock_model(Option)
      event.should_receive(:options).and_return(mock(:find => option))
      event.select(option.id)
      event.selected_option.should == option
      # Test #unselect
      event.unselect
      event.selected_option.should == nil
    end
  end
end
