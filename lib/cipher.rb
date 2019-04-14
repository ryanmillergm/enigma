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
    @shift = @keysets.keys.values.each do |keyset|
      @offsets.offset_keys.values.each do |offset|
        keyset + offset
      end
    end
    @shift
  end

  def encrypt(string, key = @shift , date)
    @keysets.set_key_values(key)
    # binding.pry
    # count = 0
    # string.each_char do |letter|
    #   count += 1
    #   unless letter.ord.between?("a".ord, "z".ord)
    #     @ciphered_code << letter
    #     next
    #   end
    # letter_code = ((((letter.ord - "a".ord) + @shift[count % 4]) % 26) + "a".ord)
    # @ciphered_code << letter_code.chr
    # end
    # @ciphered_code
  end

  def make_keys(key)
    @keysets.set_key_values(key)
  end



end
