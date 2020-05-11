class CommentsController < ApplicationController
	def create
		@bike = Bike.find(params[:bike_id])
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		@comment.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@comment = comment.find(params[:id])
		@comment.destroy
		redirect_back(fallback_location: root_path)
	end

	private
	def comment_params
		params.require(:comment).permit(:comment, :bike_id, :user_id)
	end
end
