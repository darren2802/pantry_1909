require 'minitest/autorun'
require_relative '../lib/ingredient.rb'

class TestIngredient < Minitest::Test

  def setup
    @cheese = Ingredient.new("Cheese", "oz", 50)
  end

  def test_ingredient_initialized
    assert_instance_of Ingredient, @cheese
    assert_equal "Cheese", @cheese.name
    assert_equal "oz", @cheese.unit
    assert_equal 50, @cheese.calories
  end

end
