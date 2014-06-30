class Player
  attr_accessor :hand, :hand_value


  def initialize
    @hand = []
  end
  def hit(card)
    @hand << card
  end
end

Player.new
