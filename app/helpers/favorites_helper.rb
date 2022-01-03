module FavoritesHelper

	def fav_or_unfave_button(movie, favorite)
	  if favorite
	    button_to "♡ Unfave", movie_favorite_path(movie, favorite), method: :delete
	  else
	    button_to "♥️ Fave", movie_favorites_path(movie)
	  end
	end

end

# Helpers use raw ruby code.  No Ruby html
# Helpers are methods that you call from the show page to avoid logic overload within the view
