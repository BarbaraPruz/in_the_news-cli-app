require 'pry'
class Scraper
  URL = "https://www.csmonitor.com/"

  def self.collect_stories
    stories = []

    # ToDo Handle errors
    doc = Nokogiri::HTML(open(URL))
    doc.css(".story_detail").each do |item|
      stories << {
      :title => item.css('.story_link').text.strip,
    #  :url => item.css('.story_headline a').attribute("href").text
      }
    end
    stories.uniq
  end

end
