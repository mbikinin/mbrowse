# -*- encoding : utf-8 -*-
class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :title
      t.text :body
      t.string :link
      t.belongs_to :platform
      t.string :uri
      t.timestamps
    end
    add_attachment :sliders, :image
  end
end
