class Cipher
  attr_reader :string

  def initialize(string)
    @string = string
    @keysets = []
  end

  def add_keysets(keys)
    @keysets << keys
  end

  # def encrypt
  #   binding.pry
  # end
end
