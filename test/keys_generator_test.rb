require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require './lib/enigma'
require './lib/keys_generator'
require 'pry'

class KeyGeneratorTest < MiniTest::Test

  def setup
    @keysets = KeyGenerator.new
  end

  def test_keysets_exists
    assert_instance_of KeyGenerator, @keysets
  end

  def test_there_are_four_key_values
    assert_equal 4, @keysets.set_key_values.count
  end


end
