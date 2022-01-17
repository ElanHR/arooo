FactoryBot.define do
  factory :user do
    name { "#{Faker::Name.first_name.delete("'")} #{Faker::Name.last_name.delete("'")}" }
    sequence(:email) { |n| "example#{n}@example.com" }
    username { "#{name[0..3]}_#{Faker::Internet.domain_word}" }

    factory :member do
      state { "member" }

      factory :mature_member do
        after(:create) do |user|
          user.application.processed_at = 14.days.ago
          user.application.save!
        end
      end

      factory :setup_complete_member do
        sequence(:email_for_google) { |n| "googleemail#{n}@example.com" }
        dues_pledge { [10, 25, 50].sample }
        stripe_customer_id { "123abc" }
        setup_complete { true }
      end
    end

    factory :key_member do
      state { "key_member" }
    end

    factory :voting_member do
      state { "voting_member" }
      voting_policy_agreement { true }
    end

    factory :applicant do
      state { "applicant" }
      after(:create) do |applicant|
        # Set required profile fields for a submitted application
        applicant.profile.update!(reasons: "reasons", feminism: "feminism", attendance: "attendance")
      end
    end

    factory :admin do
      is_admin { true }
      state { "voting_member" }
    end
  end
end