class PhotosController < ApplicationController
	def index
		@photos = Photo.all.where(user_id: current_user.id)
	end
end