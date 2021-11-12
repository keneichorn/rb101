INTEGERS = {
  '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0
}

def string_to_integer(string)
  int = string.chars
  int.map! { |string| INTEGERS[string] }
  int.inject(0) { |x, d| d ? (x * 10) + d : x}
end

p string_to_integer('4321') == 4321
p string_to_integer('0570') == 570