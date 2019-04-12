class Keys
  attr_reader :random_number,
              :keys

  def initialize
    @random_number = nil
    @keys = nil
  end

  def random_number_generator
    @random_number = rand(99999).to_s.rjust(5, "0")
  end

  def set_key_values
    @keys = {}
    keys["key_a"] = @random_number[0..1].to_i
    keys["key_b"] = @random_number[1..2].to_i
    keys["key_c"] = @random_number[2..3].to_i
    keys["key_d"] = @random_number[3..4].to_i
    @keys
  end

end
