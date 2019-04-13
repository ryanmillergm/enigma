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
    # binding.pry
    @keysets.set_key_values
    @offsets.offset_keys_generator
  end

  def test_cipher_exists
    assert_instance_of Cipher, @cipher
  end

  def test_cipher_takes_string
    assert_equal "string", @cipher.string
  end

  def test_add_keysets
    assert_equal [@keysets], @cipher.add_keysets(@keysets)
  end

  # def test_cipher_encrypts_string
  #   expected = "string"
  #   refute expected, @cipher.encrypt
  # end
end
