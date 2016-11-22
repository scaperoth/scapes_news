module LandingsHelper
  
  def get_img_src(string)
    img = get_img_tag(string)
    img['src'].to_s
  end
  
  def get_img_tag(string)
    doc = Nokogiri::HTML(string)
    doc.css('img').first
  end
  
  def display_array(s)
    if s.kind_of?(Array)
      return s.join(', ')
    end
    
    return s
    
  end
end
