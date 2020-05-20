class LikesController < ApplicationController
  def create
    @bike = Bike.find(params[:bike_id])
    @like =current_user.likes.new(bike_id: @bike.id)
    @like.save
    render :like
  end

  def destroy
    @bike = Bike.find(params[:bike_id])
    @like =current_user.likes.find_by(bike_id: @bike.id)
    @like.destroy
    render :like
  end

end
