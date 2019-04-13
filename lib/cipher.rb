class Cipher
  attr_reader :string,
              :keysets_obj,
              :offsets_obj,
              :shift,
              :string_arr

  def initialize(string)
    @string = string
    @keysets_obj = {}
    @offsets_obj = {}
    @shift = []
    @string_arr = []
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
  end

  def encrypt(string)
    binding.pry
  end


end

# def caeser_cipher(string, shift)
#   result = ""
#
#   string.each_char do |letter|
#     unless letter.ord.between?("a".ord, "z".ord)
#       result << letter
#       next
#     end
#
#   letter_code = ((((letter.ord - "a".ord) + shift) % 26) + "a".ord)
#
#
#   result << letter_code.chr
#   end
#   result
# end
#
# puts caeser_cipher("this is crazy", 4)
