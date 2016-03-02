class Recipe::CLI # the :: means the cli is inside recipe directory

  def call
    scrape_recipes
    list_recipes # calls this method and displays a list of recipes with a short description
    menu
    goodbye
  end

  def scrape_recipes
    new_scaprer = Recipe::Scraper.new
    new_scaprer.get_page
    new_scaprer.get_recipes
    new_scaprer.make_recipes
  end

  def list_recipes
    @recipes = Recipe::MyRecipe.all # calls the .all class method of the MyRecipe class
    @recipes.each.with_index(1) do |recipe, i| # iterates over all elements in the @@all []
      puts "#{i}. #{recipe.name}" # - #{recipe.ingredient} - #{recipe.direction}" # may only need recipe.name here
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter a recipe number for more information or type 'list' to see the recipes or type 'exit':"
      input = gets.strip.downcase

      if input.to_i > 0
        the_recipe = @recipes[input.to_i - 1]
        puts "#{the_recipe.name}"
        puts "#{the_recipe.description}"
        puts "#{the_recipe.url}"
      elsif input == "list"
        list_recipes
      else
        puts "Not sure what you want, type 'list' or 'exit'."
        # take user to page of recipe when "get recipe" is typed
        # system("open #{@recipes.[input.to_i-1].url}")
      end

    end
  end

  def goodbye
    puts "See you tomorrow with more exciting recipes"
  end

end
