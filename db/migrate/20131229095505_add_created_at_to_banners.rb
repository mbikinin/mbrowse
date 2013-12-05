class AddCreatedAtToBanners < ActiveRecord::Migration
  def change
    change_table(:banners) { |t| t.timestamps }
  end
end
