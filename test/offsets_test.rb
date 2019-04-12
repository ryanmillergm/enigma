require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require './lib/enigma'
require './lib/keys_generator'
require './lib/offsets'
require 'pry'

class OffsetsTest < MiniTest::Test

  def setup
    @keysets = KeyGenerator.new
    @offsets = Offsets.new
  end

  def test_offsets_exists
    assert_instance_of Offsets, @offsets
  end

end
