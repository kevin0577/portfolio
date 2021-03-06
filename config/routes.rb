Rails.application.routes.draw do
  devise_for :users
  root  "home#top"
  get  "home/about" => "home#about"
resources :searchs, only: [:index]
resources :users, only: [:index, :show, :edit, :update] do
  	get "follows"
  	get "follower"
  end
  	post "follow/:id" => "relationships#follow", as: "follow"
  	post "unfollow/:id" => "relationships#unfollow", as: "unfollow"

resources :bikes do
	resources :comments, only: [:create, :destroy]
	resource :bookmarks, only: [:create, :destroy]
  resource :likes, only: [:create, :destroy]
end
  get "bookmarks/index"
end