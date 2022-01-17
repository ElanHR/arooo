FactoryBot.define do
  factory :vote do
    association :user, factory: :voting_member
    application
    value { false }

    trait :yes do
      value { true }
    end

    trait :no do
      value { false }
    end
  end
end