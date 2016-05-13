class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.date :date
      t.integer :user_id
      t.integer :topic_id

      t.timestamps null: false
    end
  end
end
