class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@bikes = @user.bikes
	end

	def index
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		if user.update(user_params)
			redirect_to user_path(current_user)
		else
			render :edit
		end
	end

	def follow
		@user = User.find(params[:user_id])
	end
	def follower
		@user = User.find(params[:user_id])
	end

	private
	def user_params
		params.require(:user).permit(:user_id, :name, :bike_name, :profile_image)
	end
end
