class Photo < ActiveRecord::Base
	validates :public, :caption, :image, presence: true
	belongs_to :user
	has_many :comments
end
