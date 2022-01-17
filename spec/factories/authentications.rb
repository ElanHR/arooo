FactoryBot.define do
  factory :authentication do
    uid { rand(100000...999999).to_s }
    provider { "github" }
    association :user, factory: :member
  end
end