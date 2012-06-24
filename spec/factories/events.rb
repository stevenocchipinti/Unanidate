FactoryGirl.define do
  factory :event do
    title       { "#{Faker::Name.first_name.pluralize} party" }
    description { Faker::Lorem.paragraph }

    # This sub-factory be used in different forms, like this:
    #     @event = FactoryGirl.create :event_with_options
    #     @event = FactoryGirl.create :event_with_options, options_count: 10
    factory :event_with_options do
      ignore { options_count 5}
      after(:create) do |event, evaluator|
        FactoryGirl.create_list(:option, evaluator.options_count, event: event)
      end
    end

  end
end