require 'open-uri'

class LandingsController < ApplicationController
  
  def index
    xml = Nokogiri::XML(open("https://www.wired.com/feed"))
    xml_hash = Hash.from_xml(xml.to_s)
    xml_channel = xml_hash['rss']['channel']
    @feed = xml_channel
  end
end
