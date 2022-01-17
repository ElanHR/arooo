FactoryBot.define do
  factory :profile do
    user
    attendance { "attendance" }
    blog { "blog" }
    facebook { "facebook" }
    feminism { "feminism" }
    gravatar_email { "gravatar_email" }
    linkedin { "linkedin" }
    projects { "projects" }
    pronouns { "pronouns" }
    reasons { "reasons" }
    show_name_on_site { false }
    show_projects { false }
    show_reasons { false }
    show_skills { false }
    skills { "skills" }
    summary { "summary" }
    twitter { "twitter" }
    website { "website" }
    user_id { "user_id" }
  end
end