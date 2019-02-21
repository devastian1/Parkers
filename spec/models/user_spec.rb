require 'rails_helper'
# require File.expand_path('../../config/environment', __FILE__)

RSpec.describe User, type: :model do
  # # before(:all) do
  #   @user1 = create(:user)
  # end
  it "is valid with valid attributes" do
    expect(User.new(first_name: 'John', email: 'John@gmail.com', password: 'blah', contact_no: "+60176577018")).to be_valid
  end
  it "is not valid without a first_name" do
  	user = User.new(first_name: nil)
  	expect(user).to_not be_valid
  end
  it "is not valid without a email" do
  	user = User.new(email: nil)
  	expect(user).to_not be_valid
  end

  it "is not valid without contact_no" do
  	user = User.new(contact_no: nil)
  	expect(user).to_not be_valid
  end
end
