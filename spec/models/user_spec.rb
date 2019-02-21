require 'rails_helper'
# require File.expand_path('../../config/environment', __FILE__)

RSpec.describe User, type: :model do
  # # before(:all) do
  #   @user1 = create(:user)
  # end
  it "is valid with valid attributes" do
    expect(User.new(first_name: 'John', email: 'John@gmail.com', password: '1234567', contact_no: "+60176577018")).to be_valid
  end
  it "is not valid without a first_name" do
  	user = User.new(first_name: nil, email: 'John@gmail.com', password: '12345', contact_no: "+60176577018")
  	expect(user).to_not be_valid
  end

  it 'password length must be atleast 5 characters' do
    user = User.new(first_name: 'John', email: 'John@gmail.com', password: '12345', contact_no: "+60176577018")

    result = user.save

    expect(result).to be(true)
  end

  it "is not valid without a email" do
  	user = User.new(first_name: 'John', email: nil, password: '12345', contact_no: "+60176577018")
  	expect(user).to_not be_valid
  end

  it "is not valid without contact_no" do
  	user = User.new(first_name: 'John', email: 'John@gmail.com', password: '12345', contact_no: nil)
  	expect(user).to_not be_valid
  end

 it 'email must be unique' do
  user = User.new(first_name: 'John', email: 'John@gmail.com', password: 'blah', contact_no: "+60176577018")
  user.save

  u = User.new(first_name: 'John', email: 'John@gmail.com', password: 'blah', contact_no: "+60176577018")
  u.save

  expect(u).to_not be_valid(["has already been taken"])
  end

  it 'email with invalid format is invalid' do
  user = User.new(email: 'bugs', password: '12345')
  user.save

  expect(user).to_not be_valid(['email is not valid'])
  end
end
