class BookmarksController < ApplicationController
	def index
		@bikes = current_user.bookmarks_bikes.includes(:user).page(params[:page]).per(5)
	end

	def create
		@bike = Bike.find(params[:bike_id])
		@bookmark = current_user.bookmarks.new(bike_id: @bike.id)
		@bookmark.save
	    redirect_back(fallback_location: root_path)
	end

	def destroy
	    @bike = Bike.find(params[:bike_id])
		@bookmark = current_user.bookmarks.find_by(bike_id: @bike.id)
	    @bookmark.destroy
	    redirect_back(fallback_location: root_path)
	end
end
