class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.string :country
      t.string :city
      t.string :address

      t.timestamps null: false
    end
  end
end
