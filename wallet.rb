require 'deck'
require 'card'

class Wallet
  attr_reader :chips

  def initialize
    @wallet = wallet
  end # initialize

  def wallet
    @chips = 100
    @chip_value = 1
    @wallet = @chips * @chip_value
  end # chip_quantity

  def bet
    puts "You have $#{@wallet}."
    puts "How many chips would you like to bet?"
    @bet = gets.to_i
    unless @bet.between?(1,@wallet)
      puts "please only bet what you have"
      bet
    end
    @winnings = @bet * @chip_value
    @losings = @bet * @chip_value
  end

  def new_bet(new_bet)
    @bet = new_bet
    unless @bet.between?(1,@wallet)
      puts "please only bet what you have"
      bet
    end
    @winnings = @bet * @chip_value
    @losings = @bet * @chip_value
  end

  def win
    @wallet = @wallet + (@bet * @chip_value)
    puts "  "
    puts "************           You Won $#{@winnings}            ************"
    puts "************        You now have $#{@wallet}          ************"
    puts "  "
  end

  def lose
    @wallet = @wallet - (@bet * @chip_value)
    puts "You lost $#{@losings}."
    puts "You now have $#{@wallet}."
    if @wallet == 0
      puts "------------------GAME OVER-------------------"
      exit
    end
  end

  def wallet_value
    @wallet
  end
end
