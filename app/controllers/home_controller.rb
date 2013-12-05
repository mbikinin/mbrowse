class HomeController < ApplicationController
  def index
    @top10 = Offer.limit(10)#.order("RAND()")
    @offer_nova = Offer.limit(5).offset(5)
    @offer_popular = Offer.limit(5).offset(7)
    @offer_recomend = Offer.limit(5).offset(9)
    @offer_review = Offer.limit(3).offset(12)
    @offer_preview = Offer.limit(3).offset(15)
  end
end
