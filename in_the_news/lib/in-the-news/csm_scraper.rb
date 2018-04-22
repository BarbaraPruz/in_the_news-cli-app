require 'pry'

module InTheNews
  class CSMScraper
    BASE_URL = "https://www.csmonitor.com/"

    def self.collect_stories
      stories = []

      # ToDo Handle errors on open URL
      doc = Nokogiri::HTML(open(BASE_URL))
      doc.css("#most-viewed-ump-block-contents .story_detail").each do |item|
        stories << {
        :title => item.css('.story_link').text.strip,
        :url => BASE_URL+item.css('.story_headline a').attribute("href").text
        }
      end
      stories
    end

    def self.get_summary (url)
      doc = Nokogiri::HTML(open(url))
      doc.css(".story-head p").text.strip
    end

  end
end
