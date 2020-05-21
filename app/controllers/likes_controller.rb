class LikesController < ApplicationController
  def create
    @bike = Bike.find(params[:bike_id])
    # いいねをする対象のインスタンスを作成

    @like =current_user.likes.new(bike_id: @bike.id)
    # current_userで現在のuser_idを入れる

    @like.save
    render :like
    # 保存して、render :likeからlike.js.erbを探しに行く

  end

  def destroy
    @bike = Bike.find(params[:bike_id])
    @like = current_user.likes.find_by(bike_id: @bike.id)
    # いいねしたインスタンスを探しに行く

    @like.destroy
    render :like
    # 削除がされると、like.js.erbを探しに行く
  end

end
