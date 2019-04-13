class Cipher
  attr_reader :string,
              :keysets_obj,
              :offsets_obj

  def initialize(string)
    @string = string
    @keysets_obj = []
    @offsets_obj = []
  end

  def add_keysets(keys)
    @keysets_obj << keys
  end

  def add_offsets(keys)
    @offsets_obj << keys
  end

  # def encrypt
  #   binding.pry
  # end
end
