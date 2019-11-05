require 'minitest/autorun'
require_relative '../lib/recipe.rb'
require_relative '../lib/ingredient.rb'

class TestRecipe < Minitest::Test

  def setup
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  def test_recipe_initialized
    assert_instance_of Recipe, @mac_and_cheese
    assert_equal "Mac and Cheese", @mac_and_cheese.name
    assert_equal ({}), @mac_and_cheese.ingredients_required
  end

  def test_recipe_add_ingredients
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    ingredients_reqd = {
      @cheese => 2,
      @mac => 8
    }
    assert_equal ingredients_reqd, @mac_and_cheese.ingredients_required
  end

  def test_recipe_ingredient_amount_required
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    assert_equal 2, @mac_and_cheese.amount_required(@cheese)
    assert_equal 8, @mac_and_cheese.amount_required(@mac)
    assert_equal [@cheese, @mac], @mac_and_cheese.ingredients
    assert_equal 440, @mac_and_cheese.total_calories
  end

end
