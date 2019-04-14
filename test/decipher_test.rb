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
    @cipher = Cipher.new("string that contains special info!")
    @keysets.set_key_values
    @offsets.offset_keys_generator
    @cipher.add_keysets(@keysets)
    @cipher.add_offsets(@offsets)
    @cipher.set_shift
    @cipher.encrypt
    @decipher = Decipher.new(@cipher.ciphered_code)
    @decipher.add_cipher_shift(@cipher)
  end

  def test_decipher_exists
    assert_instance_of Decipher, @decipher
  end

  def test_decipher_takes_a_string
    assert @decipher.code.is_a? String
  end

  def test_add_cipher_shift_to_decipher
    assert_equal @cipher.shift, @decipher.shift
  end

  def test_deciphers_code
    assert_equal "string that contains special info!", @decipher.decipher_code
  end
end
