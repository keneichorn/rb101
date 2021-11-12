def triangle(left, right, bottom)
  array = [left, right, bottom]
  array.sort!

  if array[0] == 0 || (array[0] + array[1]) <= array[2]
    :invalid
  elsif array == array.reverse
    :equilateral
  elsif array[0] == array[1] || array[1] == array[2]
    :isosceles
  else
    :scalene
  end
end



p triangle(3, 3, 3)#== :equilateral
p triangle(3, 3, 1.5) #== :isosceles
p triangle(3, 4, 5) #== :scalene
p triangle(0, 3, 3) #== :invalid
p triangle(3, 1, 1) #== :invalid