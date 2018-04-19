class Story
  attr_reader :title, :byline

  @@all = []

  def initialize ( attribute_hash)
    @title = attribute_hash[:title]
    @byline = attribute_hash[:byline]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create_stories_from_collection (stories_array)
    stories_array.each { | story_hash | Story.new (story_hash) }
  end

end
