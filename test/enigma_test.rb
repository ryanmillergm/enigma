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
    # @offsets.date_convert
    @cipher = Cipher.new(@keysets, @offsets)
    @decipher = Decipher.new(@keysets, @offsets)
    @enigma = Enigma.new(@cipher, @decipher)
    # @enigma.encrypt("hello world end", "08304", "291018")
  end

  def test_enigma_exists
    assert_instance_of Enigma, @enigma
  end

  def test_enigma_encrypt
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_enigma_decrypt
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
   assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_enigma_
    expected = {:encryption=>"ojhav sdyq{",
      :key=>"02715",
      :date=>"150419"
    }
    assert_equal expected, encrypted = @enigma.encrypt("hello world", "02715")
  end

end
