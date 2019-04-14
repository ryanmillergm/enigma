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
    @cipher = Cipher.new(@keysets, @offsets)
    @keysets.set_key_values
    @offsets.offset_keys_generator
    @cipher.set_shift
  end

  def test_cipher_exists
    assert_instance_of Cipher, @cipher
  end

  def test_cipher_has_keysets_and_offsets
    assert_equal @keysets, @cipher.keysets
    assert_equal @offsets, @cipher.offsets
  end

  def test_cipher_sets_shift
    assert_equal 4, @cipher.shift.count
  end

  def test_cipher_encrypts_string
    assert @cipher.encrypt("This is a secret message") != "This is a secret message"
  end

  def test_cipher_encrypts_string
        binding.pry
    assert_equal "string", @cipher.encrypt("This is a secret message from another a mom do")
  end

end
