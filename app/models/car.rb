class Car < ApplicationRecord
	belongs_to :user
	geocoded_by :ip_address
	after_validation :geocode
	
	def self.search(search)
  		where('plate_number LIKE ?', "%#{search}%")
	end
end
