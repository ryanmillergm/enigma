class Offsets
  attr_reader :offset_keys

  def initialize
    @offset_keys = {}
  end

  def date_convert
    day = Date.today.day.to_s.rjust(2, "0")
    month = Date.today.month.to_s.rjust(2, "0")
    year = Date.today.year.to_s.rjust(2, "0")[2, 3]
    mmddyy = (day + month + year)
  end

  def date_converted_squared
    date_convert.to_i ** 2
  end

  def offset_keys_generator
    offset_keys["A_offset"] = date_converted_squared.to_s[-4].to_i
    offset_keys["B_offset"] = date_converted_squared.to_s[-3].to_i
    offset_keys["C_offset"] = date_converted_squared.to_s[-2].to_i
    offset_keys["D_offset"] = date_converted_squared.to_s[-1].to_i
    @offset_keys
    binding.pry
  end



end
