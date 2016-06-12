class CreateUserLessons < ActiveRecord::Migration
  def change
    create_table :user_lessons do |t|
      t.integer :user_id
      t.integer :lesson_id

      t.timestamps null: false
    end
    add_index :user_lessons, :user_id
    add_index :user_lessons, :lesson_id
    add_index :user_lessons, [:user_id, :lesson_id], unique: true
  end
end
