class LikesController < ApplicationController
  def create
    @bike = Bike.find(params[:bike_id])
    @like =current_user.likes.new(bike_id: @bike.id)
    @like.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @bike = Bike.find(params[:bike_id])
    @like =current_user.likes.find_by(bike_id: @bike.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

end
