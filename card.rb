# keep information about card rules
class Card
  attr_reader :rank, :suit
  def initialize(ranks, suits)
    @rank = ranks
    @suit = suits
  end

  def rank_value # if card("ace") is
    case rank
    when :A then 1
    when :J then 10
    when :Q then 10
    when :K then 10
    else
      rank
    end
  end
end
