module PhotosHelper
	def view_photos?(photo)
		photo.public || (photo.user == current_user)
	end
end