require 'minitest/autorun'
require_relative '../lib/pantry.rb'
require_relative '../lib/recipe.rb'
require_relative '../lib/ingredient.rb'

class TestPantry < Minitest::Test

  def setup
    @pantry = Pantry.new
    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
  end

  def test_pantry_initialized
    assert_instance_of Pantry, @pantry
  end

  def test_pantry_add_stock_and_check
    assert_equal ({}), @pantry.stock
    assert_equal 0, @pantry.stock_check(@cheese)
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    assert_equal 15, @pantry.stock_check(@cheese)
  end

  def test_pantry_enough_ingredients
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    refute @pantry.enough_ingredients_for?(@mac_and_cheese)
    @pantry.restock(@mac, 7)
    refute @pantry.enough_ingredients_for?(@mac_and_cheese)
    @pantry.restock(@mac, 1)
    assert @pantry.enough_ingredients_for?(@mac_and_cheese)
  end
end
