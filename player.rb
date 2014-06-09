require 'deck'
require 'card'
class Player
  def initialize
  end
end

class Wallet
  def initialize
    @wallet = wallet
  end # initialize

  def wallet
    @chips = 10
    chip_value = 10
    @wallet = @chips * chip_value
  end # chip_quantity

  def bet
    puts '    You have $' + @wallet.to_s + '.
    How many chips would you like to bet?'
    @bet = gets
    @chips -= @bet.to_i
  end
end

# h.takes_card(d.hit)
# Hand.new.takes_card(Deck.new.hit)
# h.add_card(deck.draw)
