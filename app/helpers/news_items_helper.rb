module NewsItemsHelper
    mattr_accessor :doc

    def get_img_src(item, default_img = nil)
        # init empty src
        img_src = default_img

        # check description for images
        if item.key?('description')
            img_tag = get_img_tag(item['description'])
            return img_tag['src'].to_s unless img_tag.nil?
        end

        # check for thumbnail
        if img_src == default_img
            img_src = item['thumbnail']['url'] if item.key?('thumbnail')
        end

        # check for enclosure
        if img_src == default_img
            img_src = item['enclosure']['url'] if item.key?('enclosure')
        end
        
        # check for enclosure
        if img_src == default_img
            img_src = item['content']['url'] if item.key?('content')
        end

        # return whatever source was found
        img_src
    end

    def get_default_img(_item)
        default_img = 'placeholder_tech.jpeg'
    end

    def get_img_tag(string)
        string = string[0] if string.is_a?(Array)
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
            channel = xml_hash['rss']['channel']

            channel['item'].each do |item|
                # set default values
                default_img = get_default_img(item)
                title = item['title']
                description = item['description'].is_a?(Array) ? item['description'][0] : item['description']
                link = item['link']
                categories = item['category']
                pubDate = item['pubDate']

                NewsItem.create!(title: title, description: coder.decode(description), link: link, image: get_img_src(item, default_img), categories: display_array(categories), pubdate: pubDate, news_source_id: source.id)
            end
        end
  end
end
