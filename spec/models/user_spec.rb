require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "validations" do 
    it {should validate_presence_of(:username)}
    it {should validates_uniqueness_of(:username)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_presence_of(:session_token)}
    it {should validates_uniqueness_of(:session_token)}
    it {should validate_length_of(:password).is_at_least(6)}
  end

  
  #Create Token (Manage - ensure, reset, generate)
  describe "Generates a Token" do


  #Password management (##Hashing and is_valid?)

  ##find_by_credentials

end
