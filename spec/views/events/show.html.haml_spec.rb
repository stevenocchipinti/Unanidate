require 'spec_helper'

describe "events/show" do
  before(:each) do
    @event = FactoryGirl.attributes_for :event
    assign(:event, stub_model(Event, @event))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/#{@event[:title]}/)
    rendered.should match(/#{@event[:description]}/)
  end
end
