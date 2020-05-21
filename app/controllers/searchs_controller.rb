class SearchsController < ApplicationController
	def index
		@user_or_bike = params[:option]
		if @user_or_bike == "1"
			@users = User.all.search(params[:search], @user_or_bike).page(params[:page]).per(10)
		else
			@bikes = Bike.all.search(params[:search], @user_or_bike).page(params[:page]).per(5)
		end
	end
end
