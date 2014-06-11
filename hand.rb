0
class Hand
  def initialize
    @deck = Deck.new
  end

  def deck
    @deck
  end

  def hit
    @hand << @deck.shift
  end

  def deal
    hit
    hit
  end # deal

  def hand_value
    i = @hand.count
    @hand_value = 0
    i.times do |h|
      @hand_value += @hand[h].rank_value.to_i
    end
  end

  def hand_show
    puts 'Your Hand.'
    i = @hand.count
    i.times do |h|
      print @hand[h].rank
      puts @hand[h].suit
    end
  end
end
