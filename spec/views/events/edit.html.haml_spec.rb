require 'spec_helper'

describe "events/edit" do
  before(:each) do
    @event = assign(:event,
      stub_model(Event, FactoryGirl.attributes_for(:event))
    )
  end

  it "renders the edit event form" do
    render
    assert_select "form", :action => events_path(@event), :method => "post" do
      assert_select "input#event_title", :name => "event[title]"
      assert_select "textarea#event_description", :name => "event[description]"
    end
  end
end
