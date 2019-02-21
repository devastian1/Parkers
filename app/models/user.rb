class User < ApplicationRecord
  validates_presence_of :first_name, :contact_no
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	has_secure_password
	has_many :authentications, dependent: :destroy
	mount_uploader :avatar, AvatarUploader
  enum access_level: [:parker, :super_admin]

	def self.create_with_auth_and_hash(authentication, auth_hash)
   user = self.create!(
     first_name: auth_hash["info"]["first_name"],
     last_name: auth_hash["info"]["last_name"],
     email: auth_hash["info"]["email"],
     password: SecureRandom.hex(10)
   )
   user.remote_avatar_url = auth_hash["info"]["image"]
   user.save
   user.authentications << authentication
   	return user
 	end

 # grab google to access google for user data
 	def google_token
   		x = self.authentications.find_by(provider: 'google_oauth2')
   	return x.token unless x.nil?
 	end

end
