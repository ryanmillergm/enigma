class Enigma
  attr_reader :cipher,
              :decipher,
              :encrypted_message,
              :deciphered_message

  def initialize(cipher, decipher)
    @cipher = cipher
    @decipher = decipher
    @encrypted_message = {}
    @deciphered_message = {}
  end

  def encrypt(message, key, date)
    @encrypted_message[:encryption] = @cipher.encrypt(message, key, date)
    @encrypted_message[:key] = @cipher.key
    @encrypted_message[:date] = @cipher.date
    @encrypted_message
  end

  def decrypt(ciphertext, key, date)
    @deciphered_message[:decryption] = @decipher.decrypt(ciphertext, key, date)
    @encrypted_message[:key] = @decipher.key
    @encrypted_message[:date] = @decipher.date
    @deciphered_message
  end

end
