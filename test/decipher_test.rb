require './test/test_helper'

class DecipherTest < MiniTest::Test

  def setup
    @keysets = KeyGenerator.new
    @offsets = Offsets.new
    @decipher = Decipher.new(@keysets, @offsets)
  end

  def test_decipher_exists
    assert_instance_of Decipher, @decipher
  end

  def test_decipher_sets_shift
    @decipher.decrypt("This is a secret message")
    assert_equal 4, @decipher.shift.count
  end

  def test_decipher_encrypts_string
    expected = "this is a secret message"
    assert_equal expected, @decipher.decrypt("ynrb ob f bnhxnc snbxgpn", "08304", "040895")
  end
  # 
  # def test_d
  #
  # end
end
