require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation examples here
    it 'return valid with valid attributes' do
      user = User.new(first_name: "diet", last_name: "coke", email: "diet_coke@gmail.com", password: "coke", password_confirmation: "coke")
      expect(user).to be_valid
    end

    it 'return not valid if no first_name' do
      user = User.new( last_name: "coke", email: "diet_coke@gmail.com", password: "coke", password_confirmation: "coke")
      expect(user).to_not be_valid
    end

    it 'return not valid if no last_name' do
      user = User.new(first_name: "diet", email: "diet_coke@gmail.com", password: "coke", password_confirmation: "coke")
      expect(user).to_not be_valid
    end

    it 'return not valid if no email' do
      user = User.new(first_name: "diet", last_name: "coke", password: "coke", password_confirmation: "coke")
      expect(user).to_not be_valid
    end

    it 'must have unique email' do
      user1 = User.new(first_name: "diet", last_name: "coke",email: "diet_coke@gmail.com", password: "coke", password_confirmation: "coke")
      user1.save;

      user2 = User.new(first_name: "diet", last_name: "coke", email: "DIET_COKE@gmail.com", password: "coke", password_confirmation: "coke")

      expect(user2).to_not be_valid
    end

    it 'return not valid with password not match' do
      user = User.new(first_name: "diet", last_name: "coke", email: "diet_coke@gmail.com", password: "coke", password_confirmation: "pepsi")
      expect(user).to_not be_valid
    end

    it 'return not valid with password length less than 3' do
      user = User.new(first_name: "diet", last_name: "coke", email: "diet_coke@gmail.com", password: "co", password_confirmation: "co")
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'should authenticate a user when provided an email and a password' do
      user = User.new(first_name: "diet", last_name: "coke", email: "diet_coke@gmail.com", password: "coke", password_confirmation: "coke")
      user.save()

      expect(User.authenticate_with_credentials("diet_coke@gmail.com", "coke")).to be_a User

    end

    it 'should still successfull logged in if input extra spaces around email' do
      user = User.new(first_name: "diet", last_name: "coke", email: "diet_coke@gmail.com", password: "coke", password_confirmation: "coke")
      user.save()

      expect(User.authenticate_with_credentials("   diet_coke@gmail.com  ", "coke")).to be_a User

    end

    it 'should still successfull logged in if input wrong case for email' do
      user = User.new(first_name: "diet", last_name: "coke", email: "diet_coke@gmail.com", password: "coke", password_confirmation: "coke")
      user.save()

      expect(User.authenticate_with_credentials("dIET_coke@gmail.com", "coke")).to be_a User

    end

    it 'should not be successfull logged in if input wrong email' do
      user = User.new(first_name: "diet", last_name: "coke", email: "diet_coke@gmail.com", password: "coke", password_confirmation: "coke")
      user.save()

      expect(User.authenticate_with_credentials("dIE_coke@gmail.com", "coke")).to_not be_a User

    end

    it 'should not be successfull logged in if input wrong password' do
      user = User.new(first_name: "diet", last_name: "coke", email: "diet_coke@gmail.com", password: "coke", password_confirmation: "coke")
      user.save()

      expect(User.authenticate_with_credentials("dIEt_coke@gmail.com", "cokehaha")).to_not be_a User

    end

  end

end
