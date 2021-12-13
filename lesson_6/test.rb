require 'pry'
CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

DECK = {:hearts   => CARDS.clone,
        :diamonds => CARDS.clone,
        :clubs    => CARDS.clone,
        :spades   => CARDS.clone}

def create_hand!(deck)
  hand = []
  keys = []
  2.times { |_| keys << deck.keys.sample}
  
  keys.each do |suit|
    cards = deck[suit]
    hand << [suit, cards.shuffle!.pop]
  end
  binding.pry
  hand
end

def add_card(hand, deck)
  suit = [deck.keys.sample]
  suit.each do |suit|
    cards = deck[suit]
    hand << [suit, cards.shuffle!.pop]
  end
  hand
end


deck = DECK.clone
hand = create_hand!(deck)

# hand = [[:hearts, :Ace], [:hearts, :Queen]]
