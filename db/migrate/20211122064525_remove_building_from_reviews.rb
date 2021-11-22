class RemoveBuildingFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :building, :string
  end
end
