module NewsItemsHelper
    mattr_accessor :doc

    def get_img_src(item)
        # init empty src
        img_src = nil

        # check description for images
        if item.key?('description')
            img_tag = get_img_tag(item['description'])
            return img_tag['src'].to_s unless img_tag.nil?
        end

        # check for thumbnail
        if img_src.nil?
            img_src = item['thumbnail']['url'] if item.key?('thumbnail')
        end

        # check for enclosure
        if img_src.nil?
            img_src = item['enclosure']['url'] if item.key?('enclosure')
        end

        # return whatever source was found
        img_src
    end

    def get_img_tag(string)
        doc = Nokogiri::HTML(string)
        doc.css('img').first
    end

    def display_array(s)
        return s.join(', ') if s.is_a?(Array)
        s
    end

    def populate_feed
        NewsItem.destroy_all
        sources = NewsSource.all
        sources.each do |source|
            xml = Nokogiri::XML(open(source.url))
            xml_hash = Hash.from_xml(xml.to_s)

            coder = HTMLEntities.new

            xml_hash['rss']['channel']['item'].each do |item|
                NewsItem.create!(title: item['title'], description: coder.decode(item['description']), link: item['link'], image: get_img_src(item), categories: display_array(item['category']), pubdate: item['pubDate'], news_source_id: source.id)
            end
        end
  end
end
