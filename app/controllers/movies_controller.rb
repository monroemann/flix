class MoviesController < ApplicationController

	before_action :require_sign_in, except: [:index, :show]
	before_action :require_admin, except: [:index, :show]
	before_action :set_movie, only: [:show, :edit, :update, :destroy]

	def index
		case params[:filter]
		when "upcoming"
			@movies = Movie.upcoming
		when "recent"
			@movies = Movie.recent
		else
			@movies = Movie.released
		end
		# This type of use of scopes and a case statement can be used to show filtered posts
		# by tags and by members you are following on Break Diving
	end


	def show
		@fans = @movie.fans
		@genres = @movie.genres
		if current_user
    	@favorite = current_user.favorites.find_by(movie_id: @movie.id)
  	end
	end

	def edit
	end

	def update
		if @movie.update(movie_params)
			redirect_to @movie, notice: "Movie updated successfully."
		else 
			render :edit
		end
	end

	def new
		@movie = Movie.new
	end

	def create
  	@movie = Movie.new(movie_params)
		if @movie.save
  		redirect_to @movie, notice: "Movie created successfully."
  	else
  		render :new
  	end
	end

	def destroy
		@movie.destroy
		redirect_to root_path, alert: "Movie successfully deleted."
	end

	private

	def movie_params
		params.require(:movie).permit(:title, :description, :rating, :released_on, 
																					:total_gross, :director, :duration, :image_file_name,
																					genre_ids: [])
	end	

	def set_movie
		@movie = Movie.find_by!(slug: params[:id])
	end

end
