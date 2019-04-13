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
    @cipher = Cipher.new
  end

  def test_cipher_exists
    assert_instance_of Cipher, @cipher    
  end
end
