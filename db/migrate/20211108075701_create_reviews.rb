class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :star
      t.string :description
      t.integer :user_id
      t.datetime :tdate
      t.string :prefecture
      t.string :city
      t.string :district
      t.string :building
      t.string :number

      t.timestamps
    end
  end
end
