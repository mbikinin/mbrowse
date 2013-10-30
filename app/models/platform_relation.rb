class PlatformRelation < ActiveRecord::Base
  attr_accessible :platform_id, :game_id
  belongs_to :platform
  belongs_to :game
end
