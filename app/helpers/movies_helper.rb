module MoviesHelper

	def total_gross(movie)
		if movie.flop?
			return "flop"
		else
			number_to_currency(movie.total_gross, precision: 0)
		end
	end

	def year_of(movie)
		if movie.release_on
			movie.release_on.year
		else
			"No Date"
		end
	end

end
