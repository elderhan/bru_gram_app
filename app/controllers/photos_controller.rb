class PhotosController < ApplicationController
	#before_action
	def index
		@photos = Photo.all.order(created_at: :asc)
	end

	def show
		@user = current_user
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

	def edit
		#This needs permissions
		@photo = Photo.find(params[:id])
	end

	def update
		#this needs permissions
		@photo = Photo.find(params[:id])
		if @photo.update(photo_params)
			redirect_to photo_path(@photo)
		else
			render :edit
		end
	end

	def destroy
		#this needs permissions
		@photo = Photo.find(params[:id])
		@photo.destroy
		redirect_to root_path
	end

	private
    def photo_params
      params.require(:photo).permit(:public, :caption, :image)
    end

    def verify_photo_owner
    	<%

end