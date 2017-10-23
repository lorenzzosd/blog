require 'rails_helper'

class UserTest < ActiveSupport::TestCase
  RSpec.describe User, :type => :model do
    it "is valid with valid attributes" do
      expect(User.new).to be_valid
    end

    it "is not valid without a name" do
      user = User.new(name: nil)
      expect(user).to_not be_valid
    end

    it "is not valid without a description"
    it "is not valid without a start_date"
    it "is not valid without a end_date"
  end
end
