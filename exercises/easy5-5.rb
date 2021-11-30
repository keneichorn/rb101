def cleanup(string)
  string.chars.gsub!(/[^a-z]/, ' ').squeeze(' ')
end



p cleanup("---what's my +*& line?") #== ' what s my line '
