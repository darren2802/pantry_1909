class Pantry

  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def restock(ingredient, qty)
    @stock[ingredient] += qty
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.each do |key, value|
      return false if stock_check(key) < value
    end
  end

end
