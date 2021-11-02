def fibonacci(n)
  return 0 if n == 0
  return 1 if n <= 2
  a = 0
  b = 1
  c = 0

  until n == 0
    c = a + b
    a = b
    b = c
    n -= 1
  end
  a
end


p fibonacci(1)
p fibonacci(12)
p fibonacci(22)
p fibonacci(32)
p fibonacci(42)
p fibonacci(52)
p fibonacci(62)
p fibonacci(72)
p fibonacci(82)
p fibonacci(92)
p fibonacci(102)
p fibonacci(112)
p fibonacci(122)
p fibonacci(132)
p fibonacci(142)
p fibonacci(152)
p fibonacci(162)
p fibonacci(172)
p fibonacci(182)
p fibonacci(192)