class Recipe::MyRecipe
  attr_accessor :name, :description, :url

  @@all = []

  def initialize
    @name = name
    @description = description
    @url = url
    @@all << self
  end

  def self.all # exposes the elements in the @@all [] for the CLI class to use
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.save
    @@all << self
  end

end
