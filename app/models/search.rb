class Search < ApplicationRecord

	def search_listings

		listings = Listing.all

		listings = listings.where(["title LIKE ?", "%#{title}%"]) if title.present?
		listings = listings.where(["property_type LIKE ?", property_type]) if property_type.present?
		listings = listings.where(["city LIKE ?", city]) if city.present?
		listings = listings.where(["state LIKE ?", state]) if state.present?
		listings = listings.where(["country LIKE ?", country]) if country.present?
		listings = listings.where(["price <= ?", price]) if price.present?

		return listings

	end

end
