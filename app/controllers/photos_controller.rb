class PhotosController < ApplicationController
	def index
		@photos = Photo.all.where(user_id: current_user.id)
	end

	def show
		@photo = Photo.find(params[:id])
	end

	def new
		@photo = Photo.new
	end

	def create
		@photo = current_user.photos.build(photo_params)
		if @photo.save
			redirect_to photo_path(@photo)
		else
			render :new
		end
	end

	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy
		redirect_to root_path
	end

	private
    def photo_params
      params.require(:photo).permit(:public, :caption, :image)
    end

end