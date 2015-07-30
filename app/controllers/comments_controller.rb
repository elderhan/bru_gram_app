class CommentsController < ApplicationController
	def new
		@comment = Comment.new
	end

    def create
		@photo = Photo.find(params[:photo_id])
		@comment = @photo.comments.create(comment_params)
		@comment.user = current_user
		if @comment.save
			redirect_to photo_path(@photo)
		else
			render :new
		end
	end

	def destroy
		@photo = Photo.find(params[:photo_id])
		@comment = @photo.comments.find(params[:id])
		if (is_owned(@comment))
			@comment.destroy
		end
		redirect_to photo_path(@photo)
	end


	def edit
		@photo = Photo.find(params[:photo_id])
		@comment = Comment.find(params[:id])
		if !(is_owned(@comment))
			redirect_to photo_path(@photo), alert: "This is not your comment"
		end
	end


	def update
		@photo = Photo.find(params[:photo_id])
		@comment = @photo.comments.find(params[:id])
		if (is_owned(@comment))
			if @comment.update(comment_params)
				redirect_to photo_path(@photo)
			else
				render :edit
			end
		else
			redirect_to photo_path(@photo), alert: "This is not your comment"
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:body, :user_id, :photo_id)
	end

	def is_owned(comment)
	    comment.user == current_user
	end
end