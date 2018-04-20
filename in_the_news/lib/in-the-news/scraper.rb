require 'pry'
class Scraper
  URL = "https://www.csmonitor.com/"

  def self.collect_stories
    stories = []

    # ToDo Handle errors on open URL
    doc = Nokogiri::HTML(open(URL))
    doc.css("#most-viewed-ump-block-contents .story_detail").each do |item|
      stories << {
      :title => item.css('.story_link').text.strip,
      :url => item.css('.story_headline a').attribute("href").text
      }
    end
    stories
  end

end
