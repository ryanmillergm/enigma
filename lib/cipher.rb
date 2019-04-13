class Cipher
  attr_reader :string,
              :keysets_obj,
              :offsets_obj

  def initialize(string)
    @string = string
    @keysets_obj = {}
    @offsets_obj = {}
  end

  def add_keysets(keys)
    @keysets_obj["keyset"] = keys
  end

  def add_offsets(keys)
    @offsets_obj["offset"] = keys
  end

  def encrypt
    binding.pry
    @keysets_obj["keyset"].keys.values
    @offsets_obj["offset"].offset_keys.values
  end


end
