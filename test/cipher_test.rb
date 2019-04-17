require './test/test_helper'

class CipherTest < MiniTest::Test

  def setup
    @keysets = KeyGenerator.new
    @offsets = Offsets.new
    @cipher = Cipher.new(@keysets, @offsets)
  end

  def test_cipher_exists
    assert_instance_of Cipher, @cipher
  end

  def test_cipher_has_keysets_and_offsets
    assert_equal @keysets, @cipher.keysets
    assert_equal @offsets, @cipher.offsets
  end

  def test_cipher_sets_shift
    @cipher.encrypt("This is a secret message")
    assert_equal 4, @cipher.shift.count
  end

  def test_cipher_encrypts_string
    assert @cipher.encrypt("This is a secret message") != "This is a secret message"
  end

  def test_cipher_encrypts_string
    expected = "ynrb ob f bnhxnc snbxgpn"
    assert_equal expected, @cipher.encrypt("This is a secret message", "08304", "040895")
  end

  def test_cipher_takes_key_and_sets_value
    expected = {
      "A_key"=>8,
      "B_key"=>83,
      "C_key"=>30,
      "D_key"=>4
    }
    assert_equal expected, @cipher.make_keys("08304", "291018")
  end

end
