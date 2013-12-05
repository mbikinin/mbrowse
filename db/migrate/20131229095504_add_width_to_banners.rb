class AddWidthToBanners < ActiveRecord::Migration
  def change
    add_column :banners, :width, :string
    add_column :banners, :height, :string
  end
end
