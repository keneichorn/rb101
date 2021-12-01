CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :Jack, :Queen, :King, :Ace]

DECK = { hearts: CARDS.clone,
         diamonds: CARDS.clone,
         clubs: CARDS.clone,
         spades: CARDS.clone }

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

loop do
  deck = DECK.clone
  player_hand = create_hand!(deck)
  dealer_hand = create_hand!(deck)
  p player_hand
  p total(player_hand)
  p dealer_hand
  p total(dealer_hand)
  break
end
