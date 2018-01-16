class Listing < ApplicationRecord
	enum status: { draft: 0, verified: 1 }

	belongs_to :user 
	has_many :bookings, dependent: :destroy
	serialize :photos, Array
	mount_uploaders :photos, PhotoUploader

	
end
