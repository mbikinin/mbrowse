class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.string :code
      t.boolean :is_active, :default=>1
      t.timestamps
    end
  end
end
