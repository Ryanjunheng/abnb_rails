class ListingsController < ApplicationController

	def index
		@listings = Listing.where(user_id: params[:user_id]).page params[:page]
		@listing_page = params[:listing_page] ? params[:listing_page].to_i : 1 
  		@draft_page = params[:draft_page] ? params[:draft_page].to_i : 1
		@listing_feed = Listing.where(status: 1, user_id: params[:user_id]).order(:created_at).page(@listing_page)
  		@draft_feed = Listing.where(status: 0, user_id: params[:user_id]).order(:created_at).page(@draft_page)
		@user = User.find(params[:user_id])
		@verified_listings = Listing.where(status: 1, user_id: params[:user_id])
	end

	def new
		@current_listing = Listing.new
	end

	def create 
		@listing = current_user.listings.new(listing_params)
		@listing.save 
		redirect_to user_listings_path(current_user.id)
	end 

	def show
		@current_listing = Listing.find_by(user_id: params[:user_id], id: params[:id])
		
	end

	def edit
		@current_listing = Listing.find_by(user_id: params[:user_id], id: params[:id])
	end

	def update
		@draft_listing = Listing.find_by(user_id: params[:user_id], id: params[:id])
		@draft_listing.verified!
		redirect_to user_listing_path(@draft_listing.user_id, @draft_listing.id)
	end

	def update_listing
		@current_listing = Listing.find_by(user_id: params[:user_id], id: params[:id])
		if current_user.id == @current_listing.user_id
			@current_listing.update(listing_params)
			redirect_to user_listing_path(current_user.id, @current_listing.id)
		else 
			redirect_to "/"
		end
	end

  	private 

	def listing_params 
		params.require(:listing).permit(:title, :address, :description, :number_of_bed, :number_of_guest, :price, :property_type, :zipcode, :city, :state, :country, :number_of_room, photos: [])
	end

end
