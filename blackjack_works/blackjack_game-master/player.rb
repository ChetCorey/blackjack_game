class Player
  def initialize
    @hand = []
  end

  def hit(card)
    @hand << card
  end
end

Player.new
