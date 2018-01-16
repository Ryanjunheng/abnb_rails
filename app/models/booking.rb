class Booking < ApplicationRecord
	belongs_to :user
	belongs_to :listing
	validate :check_overlapping_dates
	validate :check_max_guests
	enum status: { unpaid: 0, paid: 1 }

	def check_overlapping_dates
		#compare this new booking with the existing bookings 
		listing.bookings.each do |old_booking|
			if self.id != old_booking.id
				if overlap?(self, old_booking)
					return errors.add(:The, "booking dates are conflicting with existing bookings!")
				end
			end
		end
	end 

	def overlap?(x,y)
		(x.start_date - y.end_date) * (y.start_date - x.end_date) > 0
	end 

	def check_max_guests
		max_guests = listing.number_of_guest
		return if num_guest <= max_guests
		errors.add(:Max, "guests number exceeded!")
	end

	def total_price
		price = listing.price
		num_dates = (start_date...end_date).to_a.length
		return price * num_dates
	end
end
