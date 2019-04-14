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
    @encrypted_message[:encryption] = @cipher.encrypt(message)
    @encrypted_message[:key] = @cipher.keysets.random_number
    @encrypted_message[:date] = @cipher.offsets.date
    @encrypted_message
  end

  def decrypt(ciphertext, key, date)
    @deciphered_message[:decryption] = @decipher.decipher_code(@cipher.ciphered_code)
    @deciphered_message[:key] = @cipher.keysets.random_number
    @deciphered_message[:date] = @cipher.offsets.date
    @deciphered_message

  end

end
