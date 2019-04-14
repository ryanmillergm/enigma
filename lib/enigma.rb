class Enigma
  attr_reader :cipher,
              :decipher,
              :encrypted_message,
              :deciphered_message

  def initialize(cipher, decipher)
    @cipher = cipher
    @decipher = decipher
    @encrypted_message = {}
  end

  def encrypt(message, key, date)
    @encrypted_message[:encryption] = @cipher.encrypt(message)
    @encrypted_message[:key] = key
    @encrypted_message[:date] = date
    @encrypted_message
  end

  def decrypt(ciphertext, key, date)
    binding.pry
    @cipher.encrypt(message)
    @deciphered_message[:decryption] = @cipher.encrypt(message)
    @deciphered_message[:key] = key
    @deciphered_message[:date] = date
    @deciphered_message

  end

end
