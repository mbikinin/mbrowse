class Provider < ActiveRecord::Base
  attr_accessible :title, :code, :is_active
end
