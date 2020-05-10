class BikesController < ApplicationController
	def index
		@bikes = Bike.all
	end

	def new
		@newbike = Bike.new
	end

	def show
		@bike = Bike.find(params[:id])
	end

	def edit
		@bike = Bike.find(params[:id])
	end

	def create
		newbike = Bike.new(bike_params)
		newbike.user_id = current_user.id
		if newbike.save
			redirect_to bikes_path
		else
			render :new
		end
	end

	def update
		bike = Bike.find(params[:id])
		if bike.update(bike_params)
			redirect_to bike_path(bike.id)
		end
	end

	private
	def bike_params
		params.require(:bike).permit(:image, :title)
	end

end
