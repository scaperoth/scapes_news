require 'open-uri'

class LandingsController < ApplicationController
  
  def index
    @news_items = NewsItem.all.order(:pubdate)
  end
  
  
end
