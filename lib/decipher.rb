class Decipher
  attr_reader :keysets,
              :offsets,
              :deciphered_code,
              :shift,
              :key,
              :date

  def initialize(keysets, offsets)
    @keysets = keysets
    @offsets = offsets
    @deciphered_code = ""
    @key = key
    @date = date
    @shift = nil
  end

  def set_shift
    @shift = []
    @keysets.keys.values.length.times do |value|
      @shift << @offsets.offset_keys.values[value] + @keysets.keys.values[value]
    end
    @shift
  end

  def decrypt(ciphertext, key, date)
    make_keys(key, date)
    count = 0
    ciphertext.each_char do |letter|
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

  def make_keys(key, date)
    @keysets.set_key_values(key)
    @offsets.offset_keys_generator(date)
    set_shift
    @key = key
    @date = date
  end
end
