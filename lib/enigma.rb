class Enigma
  attr_reader :cipher,
              :decipher,
              :secret_message

  def initialize(cipher, decipher)
    @cipher = cipher
    @decipher = decipher
    @secret_message = {}
  end

  def encrypt(message, key, date)
    @secret_message[:encryption] = @cipher.encrypt(message)
    @secret_message[:key] = key
    @secret_message[:date] = date
    @secret_message
  end


end
