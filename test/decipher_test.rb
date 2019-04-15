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
    @keysets = KeyGenerator.new
    @offsets = Offsets.new
    @cipher = Cipher.new(@keysets, @offsets)
    @keysets.set_key_values
    @offsets.offset_keys_generator
    @cipher.set_shift
    @decipher = Decipher.new(@cipher)
    @decipher.add_cipher_shift

  end

  def test_decipher_exists
    assert_instance_of Decipher, @decipher
  end

  def test_add_cipher_shift_to_decipher
    assert_equal @cipher.shift, @decipher.shift
  end

  def test_deciphers_code
    skip
    assert_equal "string that contains special info!", @decipher.decipher_code
  end
end
