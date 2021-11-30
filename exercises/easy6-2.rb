VOWELS = %w(a e i o u A E I O U)

def remove_vowels(array_of_strings)
  array_of_strings.map do |string|
    string.split('').map { |x|  x unless VOWELS.include?(x)}.join('')
  end
end


p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) #== %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) #== %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']