class StaticPage < ActiveRecord::Base
  attr_accessible :title,:anounce,:text,:uri,:on_main,:on_list
end
