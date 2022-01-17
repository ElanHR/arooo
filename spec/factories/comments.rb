FactoryBot.define do
  factory :comment do
    association :application, factory: :application
    association :user, factory: :member
    body { "comment body" }
    created_at { 1.day.ago }
  end
end