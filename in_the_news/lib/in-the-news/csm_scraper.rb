module InTheNews
  class CSMScraper
    BASE_URL = "https://www.csmonitor.com/"

    def self.collect_stories
      stories = []

      # ToDo Handle errors on open URL
      doc = Nokogiri::HTML(open(BASE_URL))
      doc.css("#most-viewed-ump-block-contents .story_detail").each do |item|
        url = BASE_URL+item.css('.story_headline a').attribute("href").text
        stories << {
          :title => item.css('.story_link').text.strip,
          :url => url,
          :summary => get_summary(url)
        }
      end
      stories
    end

    def self.get_summary (url)
      doc = Nokogiri::HTML(open(url))
      # most of the time, summary is in story-head class but occasionally it is in id story-headers
      summary = doc.css(".story-head p").text.strip
      summary = doc.css("#story-headers p").text if summary.empty?
      summary
    end

  end
end
