class AddCategorysToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :category, :string
  end
end
