require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require './lib/enigma'
require './lib/keys_generator'
require './lib/offsets'
require 'simplecov'
require 'pry'

class OffsetsTest < MiniTest::Test

  def setup
    @keysets = KeyGenerator.new
    @offsets = Offsets.new
  end

  def test_offsets_exists
    assert_instance_of Offsets, @offsets
  end

  def test_date_converted_squared
    expected = @offsets.date.to_i ** 2
    assert_equal expected, @offsets.date_converted_squared
  end

  def test_offset_key_created
    assert_equal 4, @offsets.offset_keys_generator.count
  end


end
