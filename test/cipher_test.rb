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
    @keysets = KeyGenerator.new
    @offsets = Offsets.new
    @cipher = Cipher.new("string that contains special info!")
    @keysets.set_key_values
    @offsets.offset_keys_generator
    @cipher.add_keysets(@keysets)
    @cipher.add_offsets(@offsets)
    @cipher.set_shift
    @cipher.string_into_array
  end

  def test_cipher_exists
    assert_instance_of Cipher, @cipher
  end

  def test_cipher_takes_string
    assert @cipher.string.is_a? String
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
    assert_equal @cipher.string_arr, @cipher.string_into_array
  end

  def test_cipher_encrypts_string
    assert @cipher.encrypt != @cipher.string
  end

end
