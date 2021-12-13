TARGET_NUM = 21
DEALER_TARGET = TARGET_NUM - 4

CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :Jack, :Queen, :King, :Ace]

DECK = { Hearts: CARDS.clone,
         Diamonds: CARDS.clone,
         Clubs: CARDS.clone,
         Spades: CARDS.clone }

def add_space
  puts ''
end

def system_clear
  system 'clear'
end

def deep_copy(o)
  Marshal.load(Marshal.dump(o))
end

def prompt(string)
  puts "=> #{string}"
end

def push_any_key
  prompt 'Push any key to continue...'
  gets
end

def welcome
  puts "Welcome to Twenty-One".center(80)
  add_space
  puts "The goal of the game is to get as".center(80)
  puts "close to the Twenty-One as possible.".center(80)
  add_space
  puts "The cards are worth face value,".center(80)
  puts "Jack, Queen, and King are worth 10 each,".center(80)
  puts "and Aces are worth either 1 or 11, whichever".center(80)
  puts "helps you get the closest to the #{TARGET_NUM}.".center(80)
  add_space
  puts "The first person to get five wins is the champion.".center(80)
  add_space
  puts "Push any key to start".center(80)
  gets
end

def create_hand!(deck)
  hand = []
  keys = []
  2.times { keys << deck.keys.sample }

  keys.each do |suit|
    cards = deck[suit]
    hand << [suit, cards.shuffle!.pop]
  end
  hand
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
    total -= 10 if total > TARGET_NUM
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

def add_card!(hand, deck)
  deck.each { |key, value| deck.delete(key) if value.empty? }
  suit = [deck.keys.sample]
  suit.each do |card|
    cards = deck[card]
    hand << [suit[0], cards.shuffle!.pop]
  end
  hand
end

def busted?(hand)
  hand > TARGET_NUM
end

def player_formatting(player_hand)
  prompt "You have the following cards:"
  add_space
  prompt hand_formatting(player_hand)
  prompt "for a total of: #{total(player_hand)}"
end

def dealer_hand_formatting(dealer_hand, show)
  if show
    prompt hand_formatting(dealer_hand)
    prompt "for a total of: #{total(dealer_hand)}"
  else
    prompt "#{hand_formatting([dealer_hand[0]])}, (hidden)"
  end
end

def current_game(player_hand, dealer_hand, show=true)
  system_clear
  player_formatting(player_hand)
  add_space
  prompt "The Dealer has the following cards:"
  add_space

  dealer_hand_formatting(dealer_hand, show)
  add_space
end

def add_score(score, player_total, dealer_total)
  case who_won(player_total, dealer_total)
  when :player then score[:player] += 1
  when :dealer then score[:dealer] += 1
  end
end

def hit_or_stay
  answer = ''
  loop do
    prompt "Would you like to hit or stay? (h) for hit (s) for stay"
    answer = gets.chomp.downcase
    break if ['h', 's'].include?(answer)
    prompt "You must enter (h) or (s)!"
  end
  answer
end

def player_turn(player_hand, dealer_hand, deck)
  player_total = nil
  loop do
    current_game(player_hand, dealer_hand, false)
    answer = hit_or_stay
    add_card!(player_hand, deck) if answer.include?('h')
    player_total = total(player_hand)

    break if answer.include?('s') || busted?(player_total)
  end
  player_total
end

def player_stays(player_hand, dealer_hand, player_total, dealer_total, deck)
  loop do
    break if busted?(player_total)
    system_clear
    prompt "You have chosen to stay, with the total of #{player_total}"
    add_space
    push_any_key
    dealer_total = dealer_turn(player_total,
                               dealer_total,
                               player_hand,
                               dealer_hand,
                               deck)
    break
  end
  dealer_total
end

def dealer_turn(player_total, dealer_total, player_hand, dealer_hand, deck)
  loop do
    current_game(player_hand, dealer_hand)
    break if busted?(player_total)
    if busted?(dealer_total)
      prompt "The dealer busted"
    elsif dealer_total <= DEALER_TARGET
      prompt "The dealer hits!"
      add_card!(dealer_hand, deck)
      dealer_total = total(dealer_hand)
    end
    push_any_key
    break if dealer_total > DEALER_TARGET || busted?(dealer_total)
  end
  dealer_total
end

def who_won(player_total, dealer_total)
  if busted?(player_total)
    return :dealer
  elsif busted?(dealer_total) || player_total > dealer_total
    return :player
  elsif dealer_total > player_total
    return :dealer
  end
  nil
end

def results(player_total, dealer_total)
  system_clear
  if busted?(player_total)
    prompt "Your hand busted!! The hands were:"
  elsif dealer_total == player_total
    prompt "You tied the dealer. The hands were:"
  elsif busted?(dealer_total)
    prompt "The dealer busted!! The hands were:"
  elsif player_total > dealer_total
    prompt "You won!! The hands were:"
  else
    prompt "You lost to the dealer. The hands were:"
  end
  add_space
end

def display_hands(player_hand, dealer_hand)
  prompt "Player hand: #{hand_formatting(player_hand)}"
  prompt "Dealer hand: #{hand_formatting(dealer_hand)}"
  prompt "Player: #{total(player_hand)} to Dealer: #{total(dealer_hand)}"
end

def display_score(score)
  add_space
  prompt "    The score is"
  prompt "Player: #{score[:player]} vs Dealer: #{score[:dealer]}"
  add_space
  push_any_key
end

def champion?(score)
  if score[:player] == 5 || score[:dealer] == 5
    true
  else
    false
  end
end

def display_champion(score)
  system_clear
  if score[:player] == 5
    prompt 'You have beaten the dealer, and are the Champion!!'
  else
    prompt 'The Dealer has beaten you, and is the Champion!'
  end
  add_space
  push_any_key
end

def play_again
  system_clear
  choice = ''
  prompt "Would you like to play again?"
  prompt "Press (y) for yes, or (n) for no."
  loop do
    choice = gets.chomp.downcase
    break if ['y', 'n'].include?(choice)
    prompt "Please enter (y) or (n)."
  end
  choice
end

system_clear
welcome
loop do
  score = { player: 0, dealer: 0 }

  loop do
    deck = deep_copy(DECK)
    player_hand = create_hand!(deck)
    dealer_hand = create_hand!(deck)
    dealer_total = total(dealer_hand)

    player_total = player_turn(player_hand, dealer_hand, deck)
    dealer_total = player_stays(player_hand,
                                dealer_hand,
                                player_total,
                                dealer_total,
                                deck)

    add_score(score, player_total, dealer_total)
    results(player_total, dealer_total)
    display_hands(player_hand, dealer_hand)
    display_score(score)
    break if champion?(score)
  end

  prompt display_champion(score)
  choice = play_again

  break if choice.include?('n')
end
system_clear
prompt "Thank you for playing Twenty-One! Good bye."
