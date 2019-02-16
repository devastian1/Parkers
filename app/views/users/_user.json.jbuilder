json.extract! user, :id, :first_name, :last_name, :email, :password_digest, :password_confirmation, :contact_no, :cars_id, :created_at, :updated_at
json.url user_url(user, format: :json)
