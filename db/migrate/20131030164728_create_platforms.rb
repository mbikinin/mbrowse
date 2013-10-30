class CreatePlatforms < ActiveRecord::Migration
  def change
    create_table :platforms do |t|
      t.string :title
      t.string :code
      t.boolean :is_active, :default=>1
      t.timestamps
    end
  end
end
