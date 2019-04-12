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


end
