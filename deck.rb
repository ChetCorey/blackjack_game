require 'card'
# deck
class Deck
  def initialize
    @ranks = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
    @suits = [:C, :D, :H, :S]
    @deck = []
    build_deck
    shuffle_deck
    # test_deck_shuffle
  end

  def build_deck
    count = 0
    while count < 52
      r = count % 13
      s = count % 4
      @deck.push(Card.new(@ranks[r], @suits[s]))
      count += 1
      # print @deck[r].rank  # Rank test
      # puts @deck[s].suit  # Suit test
    end
  end

  def shuffle_deck
    @deck.shuffle! # changes the deck into a shuffled deck
  end
  # def test_deck_shuffle
  #   @rank_array = []
  #   @suit_array = []
  #   52.times do |i|
  #     @rank_array << @deck[i].rank
  #     @suit_array << @deck[i].suit
  #   end
  #   print @rank_array
  #   print @suit_array
  # end
end

Deck.new

# c = Card.new(:A , :C)
# puts c.rank
