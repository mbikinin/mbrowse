class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.belongs_to :category
      t.belongs_to :provider
      t.belongs_to :platform
      t.string :title
      t.string :short_text
      t.text :body
      t.string :keywords
      t.string :descriptions
      t.boolean :is_active, :default=>1
      t.boolean :is_recomend
      t.boolean :is_best
      t.boolean :in_spec_block
      
      t.timestamps
    end
    add_attachment :games, :image, :image_promo
  end
end
