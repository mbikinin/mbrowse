class CreateCategoryRelations < ActiveRecord::Migration
  def change
    create_table :category_relations do |t|
      t.belongs_to :category
      t.belongs_to :game
      t.timestamps
    end
  end
end
