require 'spec_helper'

describe "events/index" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :title => "Title",
        :description => "MyText"
      ),
      stub_model(Event,
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select ".accordion-heading > a", /Title/
    assert_select ".accordion-inner > p", /MyText/
  end
end
