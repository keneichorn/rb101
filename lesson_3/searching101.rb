def prompt(arg)
  puts "==> #{arg}"
end

array = []

prompt("Enter the first number:")
array << gets.to_i

prompt("Enter the second number:")
array << gets.to_i

prompt("Enter the third number:")
array << gets.to_i

prompt("Enter the fourth number:")
array << gets.to_i

prompt("Enter the fifth number:")
array << gets.to_i

prompt("Enter the last number:")
number = gets.to_i

if array.include?(number)
  puts "The number #{number} appears in #{array}."
else
  puts "The number #{number} doesn't appear in #{array}"
end
