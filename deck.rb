require 'card'
# deck
class Deck
    def initialize
    @ranks = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
    @suits = [:C, :D, :H, :S]
    @deck = []
    build_deck
  end

  def build_deck
    count = 0
    while count < 52
      r = count % 13
      s = count % 4
      @deck.push(Card.new(@ranks[r], @suits[s]))
      count += 1
    end
  end

  def shuffle_deck
    @deck.shuffle! # changes the deck into a shuffled deck
  end
end
