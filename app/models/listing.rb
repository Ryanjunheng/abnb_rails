class Listing < ApplicationRecord
	enum status: { draft: 0, verified: 1 }

	belongs_to :user 
	serialize :photos, Array
	mount_uploaders :photos, PhotoUploader
end
