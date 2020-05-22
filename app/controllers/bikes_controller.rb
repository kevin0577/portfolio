class BikesController < ApplicationController
	before_action :authenticate_user!
	def index
		@bikes = params[:tag_id].present? ? Tag.find(params[:tag_id]).bikes.page(params[:page]).per(5) : Bike.all.includes(:user).page(params[:page]).per(5).order(created_at: :desc)
	end

	def new
		@newbike = Bike.new
	end

	def show
		@bike = Bike.find(params[:id])
		@comment = Comment.new
		@comments = @bike.comments
	end

	def edit
		@bike = Bike.find(params[:id])
	end

	def create
		@newbike = Bike.new(bike_params)
		@newbike.user_id = current_user.id
		if @newbike.save
			flash[:notice] = "successfully create bike!"
			redirect_to bikes_path
		else
			render :new
		end
	end

	def update
		@bike = Bike.find(params[:id])
		if @bike.update(bike_params)
			flash[:notice] = "successfully update bike!"
			redirect_to bike_path(@bike)
		else
			render :edit
		end
	end

	def destroy
		@bike = Bike.find(params[:id])
		@bike.destroy
		redirect_to bikes_path, notice: "successfully delete bike!"
	end

	private
	def bike_params
		params.require(:bike).permit(:image, :title, tag_ids: [])
	end

end
