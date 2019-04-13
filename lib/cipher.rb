class Cipher
  attr_reader :string,
              :keysets_obj,
              :offsets_obj,
              :shift

  def initialize(string)
    @string = string
    @keysets_obj = {}
    @offsets_obj = {}
    @shift = []
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

  # def encrypt
  #   binding.pry
  #
  # end


end
