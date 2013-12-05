class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
        t.string :title
        t.text :anounce
        t.text :text
        t.string :uri
        t.boolean :on_main, :default=>1
        t.boolean :on_list, :default=>1
        
      t.timestamps
    end
  end
end
