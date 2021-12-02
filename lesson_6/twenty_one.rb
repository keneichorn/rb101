CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :Jack, :Queen, :King, :Ace]

DECK = { hearts: CARDS.clone,
         diamonds: CARDS.clone,
         clubs: CARDS.clone,
         spades: CARDS.clone }

def prompt(string)
  puts "=> #{string}"
end

def hand_formatting(hand)
  cards = hand.map { |card| card_formatting(card) }
  cards.join(', ')
end

def card_formatting(card)
  "#{card[1]} of #{card[0]}"
end

def total(cards)
  values = cards.map { |card| card[1] }

  score = values.map { |card| card_value(card) }
  total = score.sum

  values.select { |value| value == :Ace }.count.times do
    total -= 10 if total > 21
  end

  total
end

def card_value(cards)
  case cards
  when :Ace    then 11
  when :King   then 10
  when :Queen  then 10
  when :Jack   then 10
  else
    cards
  end
end

def create_hand!(deck)
  hand = []
  keys = []
  2.times { |_| keys << deck.keys.sample }

  keys.each do |suit|
    cards = deck[suit]
    hand << [suit, cards.shuffle!.pop]
  end
  hand
end

def busted?(hand)
  if total(hand) > 21
    true
  else
    false
  end
end

def add_card(hand, deck)
  suit = [deck.keys.sample]
  suit.each do |suit|
    cards = deck[suit]
    hand << [suit, cards.shuffle!.pop]
  end
  hand
end

def welcome
  puts "Welcome to Twenty-one".center(44)
  puts ''
  puts "The goal of the game is to get as".center(44)
  puts "close to twenty-one as possible.".center(44)
  puts ''
  puts "The cards are worth face value,".center(44)
  puts "Jack, Queen, and King are worth 10 each,".center(44)
  puts "and Aces are worth either 1 or 11, whichever"
  puts "helps you get the closest to 21.".center(44)
  puts ''
  puts "Push any key to start".center(44)
end

loop do
  system 'clear'
  welcome
  gets

  loop do
    deck = DECK.clone
    player_hand = create_hand!(deck)
    dealer_hand = create_hand!(deck)

    loop do #player turn
      system 'clear'
      prompt "You have the following cards:"
      puts ''
      prompt "#{hand_formatting(player_hand)}"
      prompt "for a total of: #{total(player_hand)}"
      puts ''
      prompt "The Dealer has the following cards:"
      puts ''
      prompt "#{hand_formatting([dealer_hand[0]])}, (hidden)"
      puts ''
      prompt "Would you like to hit or stay?"
      answer = gets.chomp.downcase
      if answer.include?('h')
        add_card(player_hand, deck)
      end
      prompt "#{hand_formatting(player_hand)}"
      prompt "#{total(player_hand)}"
      break if answer.include?('s') || busted?(player_hand)
    end

    loop do #dealer turn
      system 'clear'
      prompt "You have the following cards:"
      puts ''
      prompt "#{hand_formatting(player_hand)}"
      prompt "for a total of: #{total(player_hand)}"
      puts ''
      prompt "The Dealer has the following cards:"
      puts ''
      prompt "#{hand_formatting(dealer_hand)},"
      puts ''
      break
    end


    prompt "Would you like to play again?"
    prompt "Press (y) for yes, or (n) for no."
    answer = gets.chomp.downcase
    break if answer.include?('n')
  end

  break
end
