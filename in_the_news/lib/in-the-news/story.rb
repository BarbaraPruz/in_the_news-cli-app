module InTheNews
  class Story
    attr_reader :title, :url, :summary

    @@all = []

    def initialize ( title, url, summary)
      @title = title
      @url = url
      @summary = summary
      @@all << self
    end

    def self.all
      @@all
    end

    def self.create_stories_from_source (source)
      source.collect_stories.each do | story_hash |
        new_story = Story.new(story_hash[:title], story_hash[:url], story_hash[:summary])
      end
    end

  end
end
