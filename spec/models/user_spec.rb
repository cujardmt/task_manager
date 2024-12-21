require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.authenticate' do
    let!(:user) { User.create(username: "johnDoe", email: "test@example.com", password: "password123") }

    it "authenticates with valid credentials" do
      authenticated_user = User.authenticate("johnDoe", "password123")
      expect(authenticated_user).to eq(user)
    end

    it "does not authenticate with invalid username" do
      authenticated_user = User.authenticate("wronguser", "password")
      expect(authenticated_user).to be_nil
    end

    it "does not authenticate with invalid password" do
      authenticated_user = User.authenticate("johnDoe", "wrongpassword")
      expect(authenticated_user).to be_nil
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:username) }
    # it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:email) }
    # it { should validate_uniqueness_of(:email) }
  end

  describe 'associations' do
    it { should have_many(:tasks) }
    it { should have_many(:categories) }
  end
end