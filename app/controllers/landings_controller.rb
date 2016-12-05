require 'open-uri'

class LandingsController < ApplicationController
  before_action :require_user_signed_in
  def index
    @news_items = NewsItem.all.order(:pubdate)
  end
  
  
end
