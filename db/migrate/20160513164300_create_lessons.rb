class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.date :date
      t.reference :user, index: true, foreign_key: true
      t.integer :topic_id

      t.timestamps null: false
    end
  end
end
