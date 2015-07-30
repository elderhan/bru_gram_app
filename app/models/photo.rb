class Photo < ActiveRecord::Base
	validates :caption, :image, presence: true
	belongs_to :user
	has_many :comments
end
