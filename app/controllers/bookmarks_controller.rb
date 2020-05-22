class BookmarksController < ApplicationController
	before_action :authenticate_user!
	def index
		@bikes = current_user.bookmarks_bikes.includes(:user).order(created_at: :desc).page(params[:page]).per(5)
	end

	def create
		@bike = Bike.find(params[:bike_id])
		@bookmark = current_user.bookmarks.new(bike_id: @bike.id)
		@bookmark.save
		render :bookmark
	end

	def destroy
	    @bike = Bike.find(params[:bike_id])
		@bookmark = current_user.bookmarks.find_by(bike_id: @bike.id)
	    @bookmark.destroy
		render :bookmark
	end
end
