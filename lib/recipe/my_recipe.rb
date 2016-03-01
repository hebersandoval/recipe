# check if you need to require something here

class Recipe::MyRecipe
  attr_accessor :name, :description, :url

  @@all = []

  def initialize
    @@all << self
  end

  def self.all # exposes the elements in the @@all [] for the CLI class to use
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  # may need to move the scraping logic here instead of make it a seperate

end
