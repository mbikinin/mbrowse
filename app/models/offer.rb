class Offer < ActiveRecord::Base
  attr_accessible :name, :offerlink, :category, :locked, :description, :bannerlink, :cpl, :cpa, :epc7d, :epc90d, :category_id
  has_many :banners
  
  def self.nova
    order("updated_at desc")
  end
  def self.popular
    order("id desc")
  end
  def self.recomend
    order("id desc")
  end
end
