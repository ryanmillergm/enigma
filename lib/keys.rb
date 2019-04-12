class Keys

  def initialize
    @key = nil
  end

  def random_number_generator
    @key = rand(99999).to_s.rjust(5, "0")
  end

  def set_key_values
    keys = {}
    keys["key_a"] = @key[0..1].to_i
    keys["key_b"] = @key[1..2].to_i
    keys["key_c"] = @key[2..3].to_i
    keys["key_d"] = @key[3..4].to_i
    keys
    # binding.pry
  end

end
