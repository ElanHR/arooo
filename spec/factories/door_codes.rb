FactoryBot.define do
  factory :door_code do
    sequence(:code) { |n| "#{100000+n}" }

    trait :assigned do
      association :user, factory: :key_member
    end
  end
end