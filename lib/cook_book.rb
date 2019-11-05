class CookBook

  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def summary
    cb_summ = @recipes.map do |recipe|
      this_recipe = Hash.new{ |hash, key| hash[key] = Hash.new() }
      this_recipe[:name] = recipe.name
      ingred_arr = []
      recipe.ingredients_required.each do |recipe_obj|
        recipe_hash = Hash.new()
        recipe_hash[:ingredient] = recipe_obj[0].name
        recipe_hash[:amount] = recipe_obj[1].to_s + ' ' + recipe_obj[0].unit
        ingred_arr << recipe_hash
      end
      this_recipe[:details][:ingredients] = ingred_arr
      this_recipe[:details][:total_calories] = recipe.total_calories
      this_recipe
    end
  end

end
