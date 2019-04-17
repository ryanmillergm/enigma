class Enigma
  attr_reader :cipher,
              :decipher,
              :encrypted_message,
              :deciphered_message,
              :keysets,
              :offsets

  def initialize(cipher, decipher)
    @cipher = cipher
    @decipher = decipher
    @keysets = KeyGenerator.new
    @offsets = Offsets.new
    @encrypted_message = {}
    @deciphered_message = {}
  end

  def encrypt(message, key = @keysets.set_key_values.values.join[-4..-1], date = @offsets.date)
    @encrypted_message[:encryption] = @cipher.encrypt(message, key, date)
    @encrypted_message[:key] = @cipher.key
    @encrypted_message[:date] = @cipher.date
    @encrypted_message
  end

  def decrypt(ciphertext, key = @keysets.set_key_values.values.join[-4..-1], date = @offsets.date)
    @deciphered_message[:decryption] = @decipher.decrypt(ciphertext, key, date)
    @deciphered_message[:key] = @decipher.key
    @deciphered_message[:date] = @decipher.date
    @deciphered_message
  end

end
