require './test/test_helper'

class EnigmaTest < MiniTest::Test

  def setup
    @keysets = KeyGenerator.new
    @offsets = Offsets.new
    @cipher = Cipher.new(@keysets, @offsets)
    @decipher = Decipher.new(@keysets, @offsets)
    @enigma = Enigma.new(@cipher, @decipher)
  end

  def test_enigma_exists
    assert_instance_of Enigma, @enigma
  end

  def test_enigma_encrypt
    expected = {
      encryption: "izfop qrsgx",
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
   assert_equal expected, @enigma.decrypt("izfop qrsgx", "02715", "040895")
  end

  def test_enigma_encrypt_with_no_date
    expected = {:encryption=>"ndbsu mvxkt",
      :key=>"02715",
      :date=> Time.now.strftime("%d%m%y")
    }
    assert_equal expected, encrypted = @enigma.encrypt("hello world", "02715")
  end

  def test_enigma_decrypt_with_no_date
    @enigma.encrypt("HELLo wOrld", "02715")

    expected = {:decryption=>"hello world",
      :key=>"02715",
      :date=>Time.now.strftime("%d%m%y")
    }
    assert_equal expected, @enigma.decrypt(@enigma.encrypted_message[:encryption], "02715")
  end

  def test_enigma_encrypt_no_key_no_date
    assert_equal 3, @enigma.encrypt("hello world").count
  end

  def test_enigma_decrypt_no_key_no_date
    @enigma.encrypt("hello world")

    expected = {
      :decryption=>"hello world",
      :key=>@cipher.key,
      :date=>@offsets.date
    }
    assert_equal expected, @enigma.decrypt(@enigma.encrypted_message[:encryption], @enigma.cipher.key, @enigma.cipher.date)
  end

end
