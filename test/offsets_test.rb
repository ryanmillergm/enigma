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

  def test_offsets_converts_date_to_DDMMYY
    assert_equal 6, @offsets.date_convert.length
  end

end
