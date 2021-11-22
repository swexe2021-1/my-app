class RemoveNumberFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :number, :string
  end
end
