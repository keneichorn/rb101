def staggered_case(string)
  counter = 0
  characters = string.chars.map do |letter|
    if counter == 0 && letter =~ /[a-zA-Z]/
      counter += 1
      letter.upcase
    elsif counter == 1 && letter =~ /[a-zA-Z]/
      counter -= 1
      letter.downcase
    else
      letter
    end
  end
  characters.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'