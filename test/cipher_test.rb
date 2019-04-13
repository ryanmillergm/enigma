require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require './lib/enigma'
require './lib/keys_generator'
require './lib/offsets'
require './lib/cipher'
require 'pry'

class CipherTest < MiniTest::Test

  def setup
    @cipher = Cipher.new("string")
    @offsets = Offsets.new
    @keysets = KeyGenerator.new
    @keysets.set_key_values
    @offsets.offset_keys_generator
    @cipher.add_keysets(@keysets)
    @cipher.add_offsets(@offsets)
    @cipher.set_shift
  end

  def test_cipher_exists
    assert_instance_of Cipher, @cipher
  end

  def test_cipher_takes_string
    assert_equal "string", @cipher.string
  end

  def test_add_keysets
    expected = {
      "keyset" => @keysets
    }
    assert_equal expected, @cipher.keysets_obj
  end

  def test_add_offsets
    expected = {
      "offset" => @offsets
    }
    assert_equal expected, @cipher.offsets_obj
  end

  def test_cipher_sets_shift
    assert_equal 4, @cipher.shift.count
  end

  def test_string_into_array
    refute_empty @shift, @cipher.string_into_array
  end

  def test_cipher_encrypts_string
    skip
    expected = "string"
    refute expected, @cipher.encrypt
  end

end
