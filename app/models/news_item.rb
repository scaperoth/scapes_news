class NewsItem < ActiveRecord::Base
  acts_as_votable 
  
  belongs_to :news_source
end
