def sum_square_difference(integer)
  sum = []
  squared = []
  
  1.upto(integer) do |int|
    sum << int
    squared << int * int
  end

  sum_squared = sum.sum * sum.sum
  sum_squared - squared.sum
end

# def sum_square_difference(n)
#   sum = 0
#   sum_of_squares = 0

#   1.upto(n) do |value|
#     sum += value
#     sum_of_squares += value**2
#   end

#   sum**2 - sum_of_squares
# end

p sum_square_difference(3) #== 22
  # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100_000_000) #== 25164150
p sum_square_difference(100_000_000) #== 25164150