class PhotosController < ApplicationController
	def index
		@photos = Photo.all.where(user_id: current_user.id)
	end

	def show
		@photos = 
	end

	def new
		@photo = Photo.new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

end