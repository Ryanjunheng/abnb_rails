class HomeController < ApplicationController
  def index
  	@listing_page = params[:listing_page] ? params[:listing_page].to_i : 1 
  	@draft_page = params[:draft_page] ? params[:draft_page].to_i : 1
  	
  	@welcome_message = "Welcome to ABNB!"
  	
  	@listing_feed = Listing.includes(:user).where(status: 1).order(:created_at).page(@listing_page)
  	@draft_feed = Listing.includes(:user).where(status: 0).order(:created_at).page(@draft_page)


  	resp = RestClient.get("https://api.chucknorris.io/jokes/random")
  	hash = JSON.parse(resp.body)
  	@joke = hash["value"]
  		
  end

  def search
    if params[:country]
           @listings = Listing.where('lower(country) LIKE ? OR lower(title) LIKE ?', "%#{params[:country]}%", "%#{params[:country]}%").page params[:page]
       else
           @listings = Listing.order(:title).page params[:page]
       end  
     end

end
