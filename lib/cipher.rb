class Cipher
  attr_reader :string,
              :keysets_obj,
              :offsets_obj,
              :shift,
              :string_arr,
              :result

  def initialize(string)
    @string = string
    @keysets_obj = {}
    @offsets_obj = {}
    @shift = []
    @string_arr = []
    @result = ""
  end

  def add_keysets(keys)
    @keysets_obj["keyset"] = keys
  end

  def add_offsets(keys)
    @offsets_obj["offset"] = keys
  end

  def set_shift
    @shift = @keysets_obj["keyset"].keys.values.each do |keyset|
      @offsets_obj["offset"].offset_keys.values.each do |offset|
        keyset + offset
      end
    end
    @shift
  end

  def string_into_array
    @string.each_char { |letter| @string_arr << letter }
    @string_arr
  end

  def encrypt
    count = 0
    @string.each_char do |letter|
      count += 1
      unless letter.ord.between?("a".ord, "z".ord)
        @result << letter
        next
      end
    letter_code = ((((letter.ord - "a".ord) + @shift[count % 4]) % 26) + "a".ord)
    @result << letter_code.chr
    end
    @result
  end
end
