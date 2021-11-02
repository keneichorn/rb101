def fizzbuzz(first, last)
  array = []
  first.upto(last) do|num|
    array << fizzbuzz_value(num)
  end
  puts array.join(', ')
end

def fizzbuzz_value(num)
  if num % 3 == 0 && num % 5 == 0
      "FizzBuzz"
    elsif num % 3 == 0
      "Fizz"
    elsif num % 5 == 0
      "Buzz"
    else
      num
    end
end




fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz