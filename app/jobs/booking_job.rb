class BookingJob < ApplicationJob
  queue_as :default

  def perform(customer, place, booking, host)
	BookingMailer.booking_email_host(customer, place, booking, host).deliver_now
	BookingMailer.booking_email_customer(customer, place, booking, host).deliver_now
    # Do something later
  end
end
