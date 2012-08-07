Given /^I have (\d+) events? in the system$/ do |num_events|
  num_events.to_i.times { FactoryGirl.create :event_with_options }
end

When /^I visit the event list page$/ do
  visit events_path
end

When /^I navigate to the first event$/ do
  visit events_path
  all('.accordion-toggle').first.click
  click_link 'Show'
end

When /^I create an event with the following details:$/ do |table|
  visit events_path
  click_link 'New'
  table.rows_hash.each_pair do |key,value|
    fill_in key, with: value
  end
  click_on 'Create Event'
end

Then /^I should see (\d+) events?$/ do |num_events|
  all('.accordion-group').count.should == num_events.to_i
end

Then /^I should see an event page$/ do
  page.should have_selector 'h1#event-title'
  page.should have_selector '#description'
end

Then /^I should see an event page with the following details:$/ do |table|
  page.should have_selector 'h1#event-title', text: table.rows_hash[:Title]
  page.should have_selector '#description', text: table.rows_hash[:Description]
  page.should have_selector '#th', text: 'Date'
end
