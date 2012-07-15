Given /^I have (\d+) events? in the system$/ do |num_events|
  num_events.to_i.times { FactoryGirl.create :event_with_options }
end

When /^I browse to the event list page$/ do
  visit events_path
end

When /^I click on the first event in the event list$/ do
  all('.accordion-toggle').first.click
end

Then /^I should see (\d+) events?$/ do |num_events|
  all('.accordion-group').count.should == num_events.to_i
end

Then /^I should see the event page$/ do
  page.should have_selector 'h1#event-title'
  page.should have_selector '#description.well'
end
