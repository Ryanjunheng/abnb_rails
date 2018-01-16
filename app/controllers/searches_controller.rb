class SearchesController < ApplicationController
	def new
		@search = Search.new
		@property_type = Listing.distinct.pluck(:property_type)
	end

	def create
		@search = Search.create(search_params)
		redirect_to @search 
	end

	def show
		@search = Search.find(params[:id])
	end

	private 

	def search_params
		params.require(:search).permit(:title, :property_type, :city, :state, :country, :price)
	end

end
