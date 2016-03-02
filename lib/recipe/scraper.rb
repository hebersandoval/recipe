class Recipe::Scraper # make sure this class is collaborating with MyRecipe class

  def get_page
    # grabs the entire HTML document from the web page
    doc = Nokogiri::HTML(open("http://www.vintagerecipes.net/recipes/miscellaneous_recipes/"))
    doc
  end

  def get_recipes
    # uses css selectors to grab all of the HTML elements that contain a recipe title
    self.get_page.css("li") # this selector grabs the recipes w/ all information needing scraped
  end

  def make_recipes
    # will create a Recipe object with a name, description, url
    get_recipes.each do |rec|
      if rec.css("i").text != ""
        #recipe = Recipe::MyRecipe.new(rec.css("a").text, rec.css("i").text, rec.css("a").attr("href").value) # creates a new object
        recipe = Recipe::MyRecipe.new
        recipe.name = rec.css("a").text # find the selector that grabs the name property
        recipe.description = rec.css("i").text # find the selector that grabs the description property
        recipe.url = rec.css("a").attr("href").value # find the selector that grabs the url property
      end
    end
  end

end
