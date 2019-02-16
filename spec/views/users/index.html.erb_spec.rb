require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :password_digest => "Password Digest",
        :contact_no => "Contact No",
        :cars_id => 2
      ),
      User.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :password_digest => "Password Digest",
        :contact_no => "Contact No",
        :cars_id => 2
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => "Contact No".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
