class BookingsController < ApplicationController

	def new
		@current_listing = Listing.find_by(user_id: params[:user_id], id: params[:listing_id])
		@booking = Booking.new
	end 

	def create
		@current_listing = Listing.find_by(user_id: params[:user_id], id: params[:listing_id])
		@booking = current_user.bookings.new(booking_params)
		if @booking.save
			flash[:notice] = "Booking confirmed!"
			redirect_to user_listing_path(@current_listing.user_id, @current_listing.id)
		else
			@errors = @booking.errors.full_messages
			render "listings/show"
		end
	end

	def destroy
		@booking = Booking.find_by(user_id: params[:user_id], listing_id: params[:listing_id], id: params[:id])
		@booking.destroy
		redirect_to user_path(current_user.id)
	end

	def booking_params 
		params.require(:booking).permit(:num_guest, :start_date, :end_date, :user_id, :listing_id)
	end
end
