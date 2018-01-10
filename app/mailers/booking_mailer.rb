class BookingMailer < ApplicationMailer
	def booking_email_host(customer, place, booking, host)
  		@customer = customer
  		@place = place
  		@booking = booking
  		@host = host
  		mail(to: 'junheng102@gmail.com', subject: 'Someone just booked your place!')
  	end	

  	def booking_email_customer(customer, place, booking, host)
  		@customer = customer
  		@place = place
  		@booking = booking
  		@host = host
  		mail(to: 'junheng102@gmail.com', subject: 'Booking confirmed! ')
  	end 
end
