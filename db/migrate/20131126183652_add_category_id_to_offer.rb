class AddCategoryIdToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :category_id, :integer
  end
end
