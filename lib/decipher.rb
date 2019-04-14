class Decipher
  attr_reader :cipher,
              :deciphered_code,
              :shift

  def initialize(cipher)
    @cipher = cipher
    @deciphered_code = ""
    @shift = nil
  end

  def add_cipher_shift
    @shift = @cipher.shift
  end

  def decipher_code(string)
    count = 0
    string.each_char do |letter|
      count += 1
      unless letter.ord.between?("a".ord, "z".ord)
        @deciphered_code << letter
        next
      end
    letter_code = ((((letter.ord - "a".ord) - @shift[count % 4]) % 26) + "a".ord)
    @deciphered_code << letter_code.chr
    end
    @deciphered_code
  end
end
