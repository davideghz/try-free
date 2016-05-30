class CreateLessons < ActiveRecord::Migration
  def change

    create_table :appointments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :topic, index: true
      t.datetime :lesson_date
      t.timestamps null: false
    end

  end
end
