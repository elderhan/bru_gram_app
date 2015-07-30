module CommentsHelper

	def can_comment?(comment)
		comment.user == current_user
	end
end
