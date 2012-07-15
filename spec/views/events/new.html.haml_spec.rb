require 'spec_helper'

describe "events/new" do
  before(:each) do
    assign(:event, stub_model(
      Event,
      FactoryGirl.attributes_for(:event)
    ).as_new_record)
  end

  it "renders new event form" do
    render
    assert_select "form", :action => events_path, :method => "post" do
      assert_select "input#event_title", :name => "event[title]"
      assert_select "textarea#event_description", :name => "event[description]"
    end
  end
end
