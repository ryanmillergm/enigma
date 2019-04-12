require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require './lib/enigma'
require './lib/keys'
require 'pry'

class KeysTest < MiniTest::Test

  def setup
    @keys = Keys.new
  end

  def test_keys_exists
    assert_instance_of Keys, @keys
  end

  def test_keys_generate_five_digit_number
    assert_equal 5, @keys.random_number_generator.length
  end

  def test_there_are_four_key_values
    @keys.random_number_generator
    assert_equal 4, @keys.set_key_values.count
  end


end
