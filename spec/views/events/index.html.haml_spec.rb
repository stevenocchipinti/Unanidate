require 'spec_helper'

describe "events/index" do
  before(:each) do
    @events = [
      FactoryGirl.attributes_for(:event),
      FactoryGirl.attributes_for(:event)
    ]
    assign(:events, [
      stub_model(Event, @events[0]),
      stub_model(Event, @events[1])
    ])
  end

  it "renders a list of events" do
    render
    assert_select ".accordion-heading > a", /#{@events[0][:title]}/
    assert_select ".accordion-heading > a", /#{@events[1][:title]}/
    assert_select ".accordion-inner > p", /#{@events[0][:description]}/
    assert_select ".accordion-inner > p", /#{@events[1][:description]}/
  end
end
