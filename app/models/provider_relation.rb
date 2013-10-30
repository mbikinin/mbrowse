class ProviderRelation < ActiveRecord::Base
  attr_accessible :provider_id, :game_id
  belongs_to :provider
  belongs_to :game
end
