require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require './lib/enigma'
require './lib/keys_generator'
require './lib/offsets'
require './lib/cipher'
require './lib/decipher'
require 'pry'

class EnigmaTest < MiniTest::Test

  def setup
    @keysets = KeyGenerator.new
    @offsets = Offsets.new
    @cipher = Cipher.new(@keysets, @offsets)
    @keysets.set_key_values
    @offsets.offset_keys_generator
    @cipher.set_shift
    @decipher = Decipher.new(@cipher.ciphered_code)
    @decipher.add_cipher_shift(@cipher)
    @enigma = Enigma.new(@cipher, @decipher)
  end

  def test_enigma_exists
    assert_instance_of Enigma, @enigma
  end

  def test_enigma_encrypt
    expected = {
      encryption: "vjqtbeaweqihssi",
      key: "08304",
      date: "291018"
    }
    assert_equal expected, @enigma.encrypt("hello world end", "08304", "291018")
  end

end
