require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require './lib/enigma'
require 'pry'

class EnigmaTest < MiniTest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_enigma_exists
    assert_instance_of Enigma, @enigma
  end

  def test_enigma_encrypt

    expected = {
      encryption: "vjqtbeaweqihssi",
      key: "08304",
      date: "291018"
    }
    assert_equal expected, @enigma.encrypt("hello world end", "08304", "291018")
  end

end
