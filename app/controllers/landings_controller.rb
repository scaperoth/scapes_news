require 'open-uri'

class LandingsController < ApplicationController
  
  include FeedHelper
  
  def index
    @feed = Nokogiri::XML(open("https://www.wired.com/feed/"))
  end
end
