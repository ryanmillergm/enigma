class Offsets
  attr_reader :offset_keys,
              :date

  def initialize
    @offset_keys = {}
    @date = DateTime.now.strftime "%d%m%y"
  end

  def date_converted_squared(date = @date)
    date.to_i * date.to_i
  end

  def offset_keys_generator(date = @date)
    @offset_keys["A_offset"] = date_converted_squared(date).to_s[-4].to_i
    @offset_keys["B_offset"] = date_converted_squared(date).to_s[-3].to_i
    @offset_keys["C_offset"] = date_converted_squared(date).to_s[-2].to_i
    @offset_keys["D_offset"] = date_converted_squared(date).to_s[-1].to_i
    @offset_keys
  end



end
