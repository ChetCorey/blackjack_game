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
    @text.starting_rules
  end # def initialize

  def start
    @player_hand = []
    @house_hand = []
    @wallet.bet
    deal(@player_hand)
    deal(@house_hand)
    see_hand(@player_hand)
    player_hand_value
    house_hand_value
  end

  def restart
    @player_hand = []
    @house_hand = []
    deal(@player_hand)
    deal(@house_hand)
    see_hand(@player_hand)
    player_hand_value
    house_hand_value
  end

  def hit(user)
    check_deck
    user << @deck.shift
  end # hit_player

  def deal(user)
    hit(user)
    hit(user)
  end # deal

  def check_deck
    if @deck.count == 1
      @deck = Deck.new.shuffle_deck
      puts ".............   We just opened a new #{@deck.count} card deck   ................"
    end
  end

  def see_hand(user)
    puts 'Your hand is'
    i = user.count
    i.times do |h|
      print user[h].rank
      puts user[h].suit
    end
  end

  # def ace_check(hand, hand_value)
  #   i = hand.count
  #   i.times do |h|
  #     if (hand.rank.include(:A) && hand_value <= 11)
  #       hand_value += 10
  #     end # if
  #   end # i
  # end
  #
  # def check_blackJack(hand_value)
  #   assurt (i == 2 && hand_value == 21)
  #     puts "BLACKJACK"
  #     @wallet.win
  #   end
  # end

  def player_hand_value # this will add the value of the hand
    @player_hand_value = 0
    @player_hand.each do |card|
      @player_hand_value += card.rank_value
    end
    @player_hand.each do |card|
      if card.rank == :A
        if @player_hand_value <= 11
          @player_hand_value += 10
          if (@player_hand.count == 2 && @player_hand_value == 21)
            puts "*************** BLACKJACK **************"
            @wallet.win
            play_again
          end
        end
      end
    end
    puts "You have #{@player_hand_value}."
    if @player_hand_value < 22
      hit_prompt(@player_hand)
    else @player_hand_value > 21
      @wallet.lose
      play_again
    end
  end

  def house_hand_value
    @house_hand_value = 0
    @house_hand.each do |card|
      @house_hand_value += card.rank_value
    end
    @house_hand.each do |card|
      if card.rank == :A
        if @house_hand_value <= 11
          @house_hand_value += 10
        end
      end
    end
    if @house_hand_value <= 16
      hit(@house_hand)
      house_hand_value
    elsif @house_hand_value > 21
      puts "the house has #{@house_hand_value} Busted"
      @wallet.win
      play_again
    end # if
  end

  def hit_prompt(user)
    puts 'Would you like to [h]it or [s]tand?'
    move = gets
    if move.chomp.downcase == 'h'
      # puts "test"
      hit(user)
      see_hand(user)
      player_hand_value
    elsif move.chomp == 's'
      house_hand_value
      game_out_come
    else
      puts "type h for hit and s for stand"
      hit_prompt(user)
    end
  end

  def game_out_come
    if @house_hand_value > @player_hand_value
      puts "The house has #{@house_hand_value}. Sorry better luck next."
      @wallet.lose
      play_again
    elsif @house_hand_value == @player_hand_value
      puts "The house has #{@house_hand_value}. Sorry better luck next."
      puts "Tie goes to the house."
      @wallet.lose
      play_again
    elsif @house_hand_value < @player_hand_value
      puts "the house has #{@house_hand_value}. Winner"
      @wallet.win
      play_again
    end
  end

  def play_again
    puts '-------     Place your bet if you would like to play again     -------'
    puts "-------            Otherwise type anything to quit             -------"
    responce = gets.to_i
    if responce.between?(1,@wallet.wallet_value)
      @wallet.new_bet(responce)
      restart
    else
      puts "???      Are you sure you want to quit.        ???"
      puts "???       Type 'play' to keep playing          ???"
      puts "???   Otherwise type anything to really quit   ???"
      responce_again = gets
      if responce_again.chomp == 'play' || responce_again.chomp == 'back'
        play_again
     else
       exit
     end
    end
  end
end

game = Game.new
game.start
