# runs all the commands
require 'deck'
require 'player'
require 'text'

class Game
  def initialize
    @text = Text.new
    @deck = Deck.new.shuffle_deck
    @player = Player.new
    @wallet = Wallet.new
  end # def initialize

  def start
    @text.starting_rules
    @player_hand = []
    @house_hand = []
    @wallet.bet
    deal
    see_hand
  end

  def hit_player
    @player_hand << @deck.shift
  end # hit_player

  def hit_house
    @house_hand << @deck.shift
  end # hit_house

  def deal
    hit_player
    hit_house
    hit_player
    hit_house
    puts 'finish deal'
  end # deal

  def see_hand
    print @player_hand[0].rank
    puts @player_hand[0].suit
    print @player_hand[1].rank.Card.new.rank_value.to_s
    puts @player_hand[1].suit

  #  puts 'You have ' + ((@player_hand[0].rank).to_i + (@player_hand[1].rank).to_i).to_s
  end
end

game = Game.new
game.start
