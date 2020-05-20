class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@bikes = @user.bikes.order(created_at: :desc).page(params[:page]).per(5)
	end

	def index
		@users = User.all.page(params[:page]).per(10).search(params[:search])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "successfully update user!"
			redirect_to user_path(current_user)
		else
			render :edit
		end
	end

	def follows
		@user = User.find(params[:user_id])
		@users = User.page(params[:page]).per(10)
	end

	def follower
		@user = User.find(params[:user_id])
		@users = User.page(params[:page]).per(10)
	end

	private
	def user_params
		params.require(:user).permit(:user_id, :name, :bike_name, :profile_image)
	end
end
