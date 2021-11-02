def greetings(name, hash)
  "Hello, #{name.join(' ')}! We could use a #{hash[:title]} #{hash[:occupation]} around here."
end



greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber'})