Rails.application.routes.draw do
 
  resources :genres
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "movies#index"

  resources :movies do
    resources :reviews
    resources :favorites, only: [:create, :destroy]
  end

  get "signup" => "users#new"

  get "movies/filter/:filter" => "movies#index", as: :filtered_movies
  # The above can potentially be used to create a filter by tags, and by members you are following


  resource :session, only: [:new, :create, :destroy]

end
