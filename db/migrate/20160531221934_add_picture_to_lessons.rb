class AddPictureToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :picture, :string
  end
end
