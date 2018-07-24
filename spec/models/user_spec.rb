require 'rails_helper'

# It must be created with a password and password_confirmation fields
# These need to match so you should have an example for where they are not the same
# These are required when creating the model so you should also have an example for this
# Emails must be unique (not case sensitive; for example, TEST@TEST.com should not be allowed
# if test@test.COM is in the database)
# Email, first name, and last name should also be required

# t.string   "first_name"
# t.string   "last_name"
# t.string   "email"
# t.string   "password_digest"
# t.datetime "created_at",      null: false
# t.datetime "updated_at",      null: false

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "is valid with valid attributes" do
      @user = User.new(first_name: "User", last_name: "One", email: "user@one.com", password: "1234567", password_confirmation: "1234567")
      expect(@user).to be_valid
    end

    it "It is not valid without a FIRST NAME" do
      @user = User.new(first_name: nil, last_name: "One", email: "user@one.com", password: "1234567", password_confirmation: "1234567")
      expect(@user).to_not be_valid
    end

    it "It is not valid without a LAST NAME" do
      @user = User.new(first_name: "User", last_name: nil, email: "user@one.com", password: "1234567", password_confirmation: "1234567")
      expect(@user).to_not be_valid
    end

    it "It is not valid without a EMAIL" do
      @user = User.new(first_name: "User", last_name: "One", email: nil, password: "1234567", password_confirmation: "1234567")
      expect(@user).to_not be_valid
    end    

    it "It is not valid when PASSWORD and PASSWORD_CONFIRMATION are different" do
      @user = User.new(first_name: "User", last_name: "One", email: "user@one.com", password: "1234567", password_confirmation: "7654321")
      expect(@user).to_not be_valid
    end  

    it "It is not valid when PASSWORD have less than 7 characters" do
      @user = User.new(first_name: "User", last_name: "One", email: "user@one.com", password: "123", password_confirmation: "123")
      expect(@user).to_not be_valid
    end 

  end

end
