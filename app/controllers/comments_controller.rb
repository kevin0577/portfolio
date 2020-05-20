class CommentsController < ApplicationController
	def create
		@bike = Bike.find(params[:bike_id])
		@comment = current_user.comments.new(comment_params)
		@comment.bike_id = @bike.id
		@comment.save
		render :comment
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		render :comment
	end

	private
	def comment_params
		params.require(:comment).permit(:comment, :bike_id, :user_id)
	end
end
