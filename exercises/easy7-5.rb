def staggered_case(string)
  characters = string.chars.each_with_index.map do |letter, index|
    if index.even?
      letter.upcase
    elsif index.odd?
      letter.downcase
    end
  end
  characters.join
end



p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'