def century(year)
  year_string = year.to_s
  century = nil

  if year_string.length < 3
    century = 1
  elsif year.digits[0..1].join.to_i == 0
    century = year_string[0..-3].to_i
  else
    century = year_string[0..-3].to_i + 1
  end

  cen_string = century.to_s
  last_digit = cen_string[-1]
  
  if last_digit == '1' && cen_string[-2] != '1'
    cen_string += 'st'
  elsif last_digit == '2' && cen_string[-2]!= '1'
    cen_string += 'nd'
  elsif last_digit == '3' && cen_string[-2] != '1'
    cen_string += 'rd'
  else
    cen_string += 'th'
  end

  cen_string
end



p century(2000) #== '20th'
p century(2001) #== '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
p century(11000) 