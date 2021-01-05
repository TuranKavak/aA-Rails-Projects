require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryBot.build(:user,
      email: "jonjones@ufc.com",
      password: "good_password")
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  it "creates a password digest when a password is given" do 
    expect(user.password_digest).to_not be nil
  end

  it "creates a session token before validation" do
    user.valid?
    expect(user.session_token).to_not be_nil
  end

  describe "#is_password?" do
    it "verifies a password is correct" do
      expect(user.is_password?("good_password")).to be true
    end

    it "verifies a password is incorrect" do 
      expect(user.is_password?("bad_password")).to be false
    end
  end

  describe "#reset_session_token" do 
    it "sets a new session token on the user" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_session_token)
    end

    it "returns the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe ".find_by_credentials" do
    before { user.save! }

    it "returns user by given valid credentials" do 
      expect(User.find_by_credentials("jonjones@ufc.com","good_password")).to eq(user)  
    end

    it "returns nil by given invalid credentials" do 
      expect(User.find_by_credentials("khabibnurmagomedov@ufc.com","good_password")).to eq(nil)  
    end
  end

end
