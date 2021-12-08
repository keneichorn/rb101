TARGET_NUM = 21
DEALER_TARGET = TARGET_NUM - 3
CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :Jack, :Queen, :King, :Ace]

DECK = { hearts: CARDS.clone,
         diamonds: CARDS.clone,
         clubs: CARDS.clone,
         spades: CARDS.clone }

def deep_copy(o)
  Marshal.load(Marshal.dump(o))
end

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

def busted?(hand)
  hand > TARGET_NUM
end

def add_card(hand, deck)
  deck.each { |key, value| deck.delete(key) if value.empty? }
  suit = [deck.keys.sample]
  suit.each do |card|
    cards = deck[card]
    hand << [suit[0], cards.shuffle!.pop]
  end
  hand
end

# rubocop:disable Metrics/AbcSize
def welcome
  puts "Welcome to Twenty-One".center(48)
  puts ''
  puts "The goal of the game is to get as".center(48)
  puts "close to the Twenty-One as possible.".center(48)
  puts ''
  puts "The cards are worth face value,".center(48)
  puts "Jack, Queen, and King are worth 10 each,".center(48)
  puts "and Aces are worth either 1 or 11, whichever".center(48)
  puts "helps you get the closest to the target.".center(48)
  puts ''
  puts "Push any key to start".center(48)
end

# rubocop:disable Metrics/MethodLength
def results(player_total, dealer_total, player_hand, dealer_hand)
  if busted?(player_total)
    prompt "Your hand busted!! With the hand:"
    prompt "hand_formatting(player_hand) vs"
    prompt hand_formatting(dealer_hand)
    prompt "dealer: #{dealer_total} to player: #{player_total}"
  elsif dealer_total == player_total
    prompt "You tied the dealer. With the hand:"
    prompt "#{hand_formatting(player_hand)}, vs:"
    prompt hand_formatting(dealer_hand)
    prompt "player: #{player_total} to dealer: #{dealer_total}"
  elsif busted?(dealer_total) || player_total > dealer_total
    prompt "You won! With the hand:"
    prompt "#{hand_formatting(player_hand)}, vs:"
    prompt hand_formatting(dealer_hand)
    prompt "player: #{player_total} to dealer: #{dealer_total}"
  else
    prompt "You lost to the dealer. With the hand:"
    prompt "#{hand_formatting(player_hand)}, vs:"
    prompt hand_formatting(dealer_hand)
    prompt "dealer: #{dealer_total} to player: #{player_total}"
  end
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

# rubocop:disable Metrics/AbcSize
def current_game(player_hand, dealer_hand, unhidden=true)
  system 'clear'
  prompt "You have the following cards:"
  puts ''
  prompt hand_formatting(player_hand)
  prompt "for a total of: #{total(player_hand)}"
  puts ''
  prompt "The Dealer has the following cards:"
  puts ''

  if unhidden
    prompt hand_formatting(dealer_hand)
    prompt "for a total of: #{total(dealer_hand)}"
  else
    prompt "#{hand_formatting([dealer_hand[0]])}, (hidden)"
  end
  puts ''
end
# rubocop:enable Metrics/AbcSize

def who_won?(player_total, dealer_total)
  if busted?(player_total)
    return 2
  elsif busted?(dealer_total) || player_total > dealer_total
    return 1
  else
    return 2
  end
end

loop do # welcome screen
  system 'clear'
  welcome
  gets

  loop do # first to 5 wins loop
    player_wins = 0
    dealer_wins = 0

    loop do # outer game loop
      deck = deep_copy(DECK)
      player_hand = create_hand!(deck)
      dealer_hand = create_hand!(deck)
      player_total = total(player_hand)
      dealer_total = total(dealer_hand)
      play_again = ''

      loop do # player turn loop
        current_game(player_hand, dealer_hand, false)
        answer = nil

        loop do
          prompt "Would you like to hit or stay? (h) for hit (s) for stay"
          answer = gets.chomp.downcase
          break if ['h', 's'].include?(answer)
          prompt "You must enter (h) or (s)!"
        end

        if answer.include?('h')
          add_card(player_hand, deck)
          player_total = total(player_hand)
        end
        prompt hand_formatting(player_hand)
        prompt player_total
        break if answer.include?('s') || busted?(player_total)
      end # player turn loop end

      loop do # busted player hand loop
        break if busted?(player_total)
        system 'clear'
        prompt "You have chosen to stay, with the total of #{player_total}"
        puts ''
        prompt "Push any key to continue to the dealer's turn.."
        gets

        loop do # dealer turn loop
          current_game(player_hand, dealer_hand)

          if busted?(player_total)
            break
          elsif busted?(dealer_total)
            prompt "The dealer busted"
            break
          elsif dealer_total <= DEALER_TARGET
            prompt "The dealer hits!"
            add_card(dealer_hand, deck)
            dealer_total = total(dealer_hand)
          end

          prompt "Push any key to continue.."
          gets
          break if dealer_total > DEALER_TARGET || busted?(dealer_total)
        end # dealer turn loop end

        break
      end # busted player hand loop end

      if who_won?(player_total, dealer_total) == 1
        player_wins += 1
      elsif who_won?(player_total, dealer_total) == 2
        dealer_wins += 1
      end

      system 'clear'
      results(player_total, dealer_total, player_hand, dealer_hand)
      prompt "Would you like to play again?"
      prompt "Press (y) for yes, or (n) for no."
      puts ''

      loop do
        play_again = gets.chomp.downcase
        break if ['y', 'n'].include?(play_again)
        prompt "Please enter (y) or (n)."
      end

      break if play_again.include?('n')
    end # outer game loop end

    break if player_wins == 5 || dealer_wins == 5
  end # first to 5 wins loop end

  prompt "Thank you for playing Twenty-One! Good bye."
  break
end # welcome screen end
