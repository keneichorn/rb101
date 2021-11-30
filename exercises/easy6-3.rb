def find_fibonacci_index_by_length(fib_index)
  count = 1
  count1 = 1
  count2 = 0
  index = 1

  until count.to_s.size == fib_index
    count2 = count + count1
    count = count1
    count1 = count2
    index += 1
  end

  index
end




p find_fibonacci_index_by_length(2) #== 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) #== 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) #== 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847