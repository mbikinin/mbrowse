class StaticPagesController < ApplicationController
  def show
    @page = StaticPage.find_by_uri(params[:uri]) || not_found
    @title = @page.title
  end
end
