def triangle(angle1, angle2, angle3)
  array = [ angle1, angle2, angle3 ].sort

  return :invalid if array.sum != 180 || array.include?(0)
  return :obtuse if array[2] > 90
  return :right if array[2] == 90
  return :acute if array[2] < 90
end


p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid