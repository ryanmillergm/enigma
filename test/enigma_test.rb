require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require './lib/enigma'
require 'pry'

class EnigmaTest < MiniTest::Test

  def test_enigma_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end


end
