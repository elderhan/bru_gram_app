class AddLikeNumberToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :like_number, :integer
  end
end
