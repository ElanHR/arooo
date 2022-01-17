FactoryBot.define do
  factory :application do
    association :user, factory: :applicant
    state { "submitted" }
    agreement_terms { true }
    agreement_policies { true }
    agreement_female { true }

    factory :unsubmitted_application do
      state { "started" }
    end

    factory :stale_application do
      stale_email_sent_at { nil }
      submitted_at { 14.days.ago }
    end

    factory :approvable_application do
      submitted_at { 7.days.ago }

      after(:create) do |application, _|
        create_list(:vote, Application.minimum_yes_votes, application: application, value: true)
        create_list(:sponsorship, Application::MINIMUM_SPONSORS, application: application)
      end
    end

    factory :rejectable_application do
      after(:create) do |application, _|
        create_list(:vote, Application::MAXIMUM_NO + 1, application: application, value: false)
      end
    end
  end
end