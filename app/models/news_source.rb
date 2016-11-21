class NewsSource < ActiveRecord::Base
  acts_as_votable 
  
  #https://www.wired.com/feed/
end
