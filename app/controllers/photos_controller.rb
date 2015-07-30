class PhotosController < ApplicationController
	def index
		@photos = Photo.all.order(created_at: :asc)
	end

	def show
		  @photo = Photo.find(params[:id])
		  @comment = Comment.new
		if view_certain_photos(@photo)
			redirect_to photos_path, alert: "This photo is private"
		end
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
		@photo = Photo.find(params[:id])
		if !(verify_photo_owner(@photo))
			redirect_to photos_path, alert: "This photo is not yours"
		end
	end

	def update
		@photo = Photo.find(params[:id])
		if !(verify_photo_owner(@photo))
		    if @photo.update(photo_params)
			    redirect_to photo_path(@photo)
		    else
			    render :edit
		    end
		else
		    redirect_to photos_path, alert: "This photo is not yours"
		end
	end

	def destroy
		@photo = Photo.find(params[:id])
		if verify_photo_owner(@photo)
		  @photo.destroy
		  redirect_to root_path
		else
			redirect_to photos_path, alert: "This photo is not yours"
		end
	end

	def profile
		@photos = Photo.all.order(created_at: :asc)
	end

	#def like
  	#	@photo = Photo.find(params[:id])
  	#	@photo.liked_by current_user

  	#	if request.xhr?
   	#	  head :ok
 	#	else
    #	  redirect_to photo_path(@photo)
  	#	end
	#end

	private
      def photo_params
        params.require(:photo).permit(:public, :caption, :image)
      end
 
      def verify_photo_owner(photo)
        photo.user == current_user
      end

      def view_certain_photos(photo)
	    !(photo.user == current_user || photo.public == true)
	  end

end