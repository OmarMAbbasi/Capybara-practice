# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "validations" do 
    it {should validate_presence_of(:username)}
    it {should validate_uniqueness_of(:username)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_presence_of(:session_token)}
    it {should validate_uniqueness_of(:session_token)}
    it {should validate_length_of(:password).is_at_least(6)}
  end

  describe "session_token management" do
    user = User.new(username: "bigO")
    it "Ensures session_token" do
      user.ensure_session_token
      expect(user.session_token).to_not eq(nil)
    end
    it "Resets session_token" do
      old_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(old_token)
      expect(user.session_token).to_not be(nil)
    end
  end

  describe "password management" do 
    user = User.new(username: "bigO")
    it "Password_digest should be different than password" do
      user.password=("password")
      expect(user.password_digest).to_not eq(user.password)
    end

    it "Password is not saved in database" do
      user.save
      user = User.last
      expect(user.password).to be(nil)
    end

    it "is_valid?" do
      expect(user.is_valid?("password")).to_be true
      expect(user.is_valid?("password1")).to_be false
    end
  end  

  describe "valid credentials?" do
    
    it "valid credentials" do
      user.valid_credentials("bigO", "password").to_be true
    end 
    
    it "invalid credentials" do
      user.valid_credentials("bigO", "passwoSrd").to_be false    
      user.valid_credentials("bSigO", "password").to_be false    
    end 
  end
end
