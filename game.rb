require 'deck'
require 'wallet'
require 'text'
require 'player'
# runs all the commands
class Game
  def initialize
    @text = Text.new
    @deck = Deck.new.shuffle_deck
    @wallet = Wallet.new
    @player = Player.new
  end # def initialize

  def start
    @text.starting_rules
    @player_hand = []
    @house_hand = []
    @wallet.bet
    deal(@player_hand)
    deal(@house_hand)
    see_hand(@player_hand)
    @house_hand_value = 0
    @player_hand_value = 0
    player_hand_value
    house_hand_value
    player_hand_value
    hit_prompt(@player_hand)
  end

  def hit(user)
    user << @deck.shift
  end # hit_player

  def deal(user)
    hit(user)
    hit(user)
  end # deal

  def see_hand(user)
    puts 'Your hand'
    i = user.count
    i.times do |h|
      print user[h].rank
      puts user[h].suit
    end
  end

  # def ace_rules
  #   i = hand.count
  #   i.times do |h|
  #     if (hand[h].rank_value == 11) &&
  #
  #     end # if
  #   end # i
  # end

  def player_hand_value # this will add the value of the hand
    i = @player_hand.count
    i.times do |h|
      @player_hand_value += @player_hand[h].rank_value
    end
    puts "You have #{@player_hand_value}."
    if @player_hand.rank.include(:A) && @player_hand_value <= 11
      @player_hand_value += 10
    elsif @house_hand_value >= @player_hand_value
      @wallet.lose
    elsif @house_hand_value < @player_hand_value
      @wallet.win
    end
  end

  def house_hand_value
    i = @house_hand.count
    @house_hand_value = 0
    i.times do |h|
      @house_hand_value += @house_hand[h].rank_value
    end
    if @house_hand_value <= 16
      hit(@house_hand)
      house_hand_value
    elsif @house_hand_value > 21
      puts "the house has #{@house_hand_value} Busted"
    end # if
  end

  def hit_prompt(user)
    puts 'Would you like to hit or stand?'
    move = gets
    if move.chomp == 'hit'
      # puts "test"
      hit(user)
      see_hand(user)
      hand_value(user)
    elsif move.to_s == 'stand'
    end
  end
end

game = Game.new
game.start
