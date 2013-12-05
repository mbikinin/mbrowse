class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :title
      t.string :uri
      t.integer :lft
      t.integer :rgt
      t.integer :depth
      t.integer :parent_id
      
      t.boolean :in_main
      t.boolean :in_footer
      t.boolean :in_special
      t.timestamps
    end
  end
end
