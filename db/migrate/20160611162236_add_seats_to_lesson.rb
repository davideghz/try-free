class AddSeatsToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :seats, :integer
  end
end
