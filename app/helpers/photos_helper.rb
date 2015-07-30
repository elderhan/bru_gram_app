module PhotosHelper
	def view_photos?(photo)
		photo.public || (photo.user == current_user)
	end

	def own_photo?(photo)
		photo.user == current_user
	end

end