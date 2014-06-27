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
    @winnings = @bet * @chip_value
    @losings = @bet * @chip_value
  end

  def win
    @wallet = @wallet + (@bet * @chip_value)
    puts "You Won $#{@winnings}."
    puts "You now have $#{@wallet}."
  end

  def lose
    @wallet = @wallet - (@bet * @chip_value)
    puts "You lost $#{@losings}."
    puts "You now have $#{@wallet}."
  end
end
