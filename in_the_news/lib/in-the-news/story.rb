module InTheNews
  class Story
    attr_reader :title, :url
    attr_accessor :summary

    @@all = []

    def initialize ( title, url)
      @title = title
      @url = url
      @@all << self
    end

    def self.all
      @@all
    end

    def self.create_stories_from_source (source)
      source.collect_stories.each do | story_hash |
        new_story = Story.new(story_hash[:title], story_hash[:url])
        new_story.summary = source.get_summary(new_story.url)
      end
    end

  end
end
