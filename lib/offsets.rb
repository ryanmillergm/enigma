class Offsets

  def date_convert
    day = Date.today.day.to_s.rjust(2, "0")
    month = Date.today.month.to_s.rjust(2, "0")
    year = Date.today.year.to_s.rjust(2, "0")[2, 3]
    mmddyy = (day + month + year)
  end

  def date_converted_squared
    date_convert.to_i ** 2
  end

end
