class Cipher
  attr_reader :shift,
              :ciphered_code,
              :keysets,
              :offsets,
              :key,
              :date

  def initialize(keysets, offsets)
    @keysets = keysets
    @offsets = offsets
    @shift = []
    @ciphered_code = ""
    @key = nil
    @date = nil
  end

  def set_shift
    @shift = []
    @keysets.keys.values.length.times do |value|
      @shift << @offsets.offset_keys.values[value] + @keysets.keys.values[value]
    end
    @shift
  end

  def encrypt(message, key, date)
    make_keys(key, date)
    count = 0
    message.each_char do |letter|
      count = 0 if count > 39
      count += 1
      unless letter.downcase.ord.between?("a".ord, "z".ord)
        @ciphered_code << letter
        next
      end
    letter_code = ((((letter.ord - "a".ord) + @shift[count % 4]) % 26) + "a".ord)
    if letter_code > 122
      letter_code = letter_code - 1
    end
    @ciphered_code << letter_code.chr
    end
    @ciphered_code
  end

  def make_keys(key, date)
    @keysets.set_key_values(key)
    @offsets.offset_keys_generator(date)
    set_shift
    @key = key
    @date = date
  end

end
