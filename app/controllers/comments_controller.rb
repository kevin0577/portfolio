class CommentsController < ApplicationController
	def create
		@bike = Bike.find(params[:bike_id])
		@comment = current_user.comments.new(comment_params)
		@comment.bike_id = @bike.id
		if @comment.save
			render :comment
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		if @comment.destroy
			render :comment
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:comment, :bike_id, :user_id)
	end
end
