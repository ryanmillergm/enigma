class Cipher
  attr_reader :shift,
              :ciphered_code,
              :keysets,
              :offsets

  def initialize(keysets, offsets)
    @keysets = keysets
    @offsets = offsets
    @shift = []
    @ciphered_code = ""
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
      count += 1
      unless letter.ord.between?("a".ord, "z".ord)
        @ciphered_code << letter
        next
      end
    letter_code = ((((letter.ord - "a".ord) + @shift[count % 4]) % 26) + "a".ord)
    @ciphered_code << letter_code.chr
    end
    @ciphered_code
    binding.pry
  end

  def make_keys(key, date)
    @keysets.set_key_values(key)
    @offsets.offset_keys_generator(date)
    set_shift
  end



end
