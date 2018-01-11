class PaymentController < ApplicationController
  def new
  	@client_token = Braintree::ClientToken.generate
  	@current_booking = Booking.find_by(user_id: params[:user_id], listing_id: params[:listing_id], id: params[:booking_id])
  end

  def create
  	@current_booking = Booking.find_by(user_id: params[:user_id], listing_id: params[:listing_id], id: params[:booking_id])
	  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

	  result = Braintree::Transaction.sale(
	   :amount => @current_booking.total_price, 
	   :payment_method_nonce => 'fake-valid-nonce',
	   :options => {
	     	:submit_for_settlement => true
	    }
	   )

	  if result.success?
	  	
	  	@current_booking.paid!
	    redirect_to user_path(@current_booking.user_id), :flash => { :success => "Transaction successful!" }
	  else
	    redirect_to user_path(@current_booking.user_id), :flash => { :error => "Transaction failed. Please try again." }
	  end
	end
end
