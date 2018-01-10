class BookingMailer < ApplicationMailer
	def booking_email(customer, place, host)
  		@customer = customer
  		@place = place
  		@host = host
  	
  		mail(to: 'junheng102@gmail.com', subject: 'Someone just booked your place!')
  	end	
end
