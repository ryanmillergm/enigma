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


end
