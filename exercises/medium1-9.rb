def fibonacci(nth)
  fib = 1
  first = 1
  second = 1
  count = 3

  if nth <= 2
    fib
  else
    loop do
      fib = first + second
      first = second
      second = fib
      break if count == nth
      count += 1
    end
  end
  
  "#{nth}: #{fib.digits.first}"
end



p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501