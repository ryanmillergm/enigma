require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require './lib/enigma'
require './lib/keys_generator'
require './lib/offsets'
require './lib/cipher'
require './lib/decipher'
require 'pry'

class DecipherTest < MiniTest::Test

  def setup
    @decipher = Decipher.new
  end
  def test_decipher_exists
    assert_instance_of Decipher, @decipher
  end
end
