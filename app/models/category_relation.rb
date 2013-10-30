class CategoryRelation < ActiveRecord::Base
  attr_accessible :category_id, :game_id
  belongs_to :category
  belongs_to :game
end
