FactoryGirl.define do
  factory :option do
    datetime { Random.rand(0...14).days.from_now }
  end
end
