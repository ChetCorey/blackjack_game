class Player
  def initialize
    @hand = []
  end

  def hit(card)
    @hand << card
  end



  def player_hand_value # this will add the value of the hand
    i = @player_hand.count
    @player_hand_value = 0
    i.times do |h|
      @player_hand_value += @player_hand[h].rank_value.to_i
    end
    puts "You have #{@player_hand_value}."
    if (i == 2) && (@player_hand_value == 21)
      @wallet.win
      play_again
    elsif @house_hand_value.to_i >= @player_hand_value.to_i
      @wallet.lose
    elsif @house_hand_value.to_i < @player_hand_value.to_i
      @wallet.win
    end
  end
end

Player.new
