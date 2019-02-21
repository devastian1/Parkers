FactoryBot.define do
  factory :user do
    first_name "Joe"
    last_name "smith"
    email "joe@gmail.com"
    password "blah"
    password_confrimation "blah"
    contact_number "+60176577018"
  end
end