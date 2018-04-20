module InTheNews
  class Story
    attr_reader :title, :source

    @@all = []

    def initialize ( attributes_hash, source)
      attributes_hash.each { |key, value| instance_variable_set("@#{key}", value) }
      @source = source
      @@all << self
    end

    def summary
      source.get_summary(@url)
    end

    def url
      source::BASE_URL + @url
    end

    def self.all
      @@all
    end

    def self.create_stories_from_source (source)
      source.collect_stories.each { | story_hash | Story.new(story_hash, source) }
    end

  end
end
