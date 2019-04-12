class Keys

  def initialize
    @key = nil
  end

  def random_number_generator
    @key = rand(99999).to_s.rjust(5, "0")
  end

end
