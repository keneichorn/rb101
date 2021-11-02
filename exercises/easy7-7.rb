def show_multiplicative_average(array_of_integers)
  divisor = array_of_integers.size
  product = array_of_integers.inject(:*)
  answer = product.to_f / divisor
  puts "The result is #{format("%#.3f", answer)}"
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667