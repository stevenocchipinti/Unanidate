Given /^I have (\d+) events? in the system$/ do |num_events|
  num_events.to_i.times { FactoryGirl.create :event }
end

When /^I browse to the event list page$/ do
  visit events_path
end

Then /^I should see (\d+) events?$/ do |num_events|
  all('.accordion-group').count.should == num_events.to_i
end
