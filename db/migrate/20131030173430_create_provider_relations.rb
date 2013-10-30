class CreateProviderRelations < ActiveRecord::Migration
  def change
    create_table :provider_relations do |t|
      t.belongs_to :provider
      t.belongs_to :game
      t.timestamps
    end
  end
end
