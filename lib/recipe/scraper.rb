# check if you need to require something here

class Recipe::Scraper # make sure this class is collaborating with MyRecipe class
  #attr_accessor :my_recipe

  def get_page
    # grabs the entire HTML document from the web page
    doc = Nokogiri::HTML(open("http://www.vintagerecipes.net/recipes/miscellaneous_recipes/"))
  end

  def get_recipes
    # uses css selectors to grab all of the HTML elements that contain a recipe title
    self.get_page.css("li") # this selector grabs the recipes w/ all information needing scraped
  end

  def make_recipes
    # will create a Recipe object with a name, description, url
    get_recipes.each do |rec|
      recipe = MyRecipe.new # instantiates a new object
      recipe.name = rec.css("a").text # find the selector that grabs the name property
      recipe.description = rec.css("i").text # find the selector that grabs the description property
      recipe.url = rec.css("li a").attr("href").value # find the selector that grabs the url property
      binding.pry
    end
  end

  def print_recipes
    # iterates over all recipes that get created to puts out a list of recipes
    self.get_recipes
    MyRecipe.all.each do |recipe|
      if recipe.name
        puts "Recipe Name: #{recipe.name}"
        puts "Description: #{recipe.description}"
        puts "URL: #{recipe.url}"
      end
    end
  end

end
