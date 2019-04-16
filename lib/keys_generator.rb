class KeyGenerator
  attr_reader :keys,
              :random_number

  def initialize
    @keys = {}
    @random_number = nil
  end

  def set_key_values(key = @random_number)
    @random_number = rand(99999).to_s.rjust(5, "0")
    @keys["A_key"] = key[0..1].to_i
    @keys["B_key"] = key[1..2].to_i
    @keys["C_key"] = key[2..3].to_i
    @keys["D_key"] = key[3..4].to_i
    @keys
  end
end
