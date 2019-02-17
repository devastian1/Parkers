class Car < ApplicationRecord
	belongs_to :user
	
	def self.search(search)
  		where('plate_number LIKE ?', "%#{search}%")
	end
end
