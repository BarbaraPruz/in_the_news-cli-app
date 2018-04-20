class Story
  attr_reader :title, :url

  @@all = []

  def initialize ( attributes_hash)
    attributes_hash.each { |key, value| instance_variable_set("@#{key}", value) }
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create_stories_from_collection (stories_array)
    stories_array.each { | story_hash | Story.new (story_hash) }
  end

end
