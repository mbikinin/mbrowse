class CreatePlatformRelations < ActiveRecord::Migration
  def change
    create_table :platform_relations do |t|
      t.belongs_to :platform
      t.belongs_to :game
      t.timestamps
    end
  end
end
