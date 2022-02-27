require "spec_helper"

describe Profile do
  subject { create(:profile, user: user) }
  let(:user) { create(:user, username: "something_predictable") }

  describe "validations" do
    it { is_expected.to validate_presence_of(:user_id) }
  end

  it "makes twitter url from input if available" do
    expect(subject.twitter_url).to eq("https://twitter.com/twitter")
  end

  it "makes github url from input if available" do
    expect(subject.github_url).to eq("https://github.com/something_predictable")
  end
end
